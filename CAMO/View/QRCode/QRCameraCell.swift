//
//  QRCameraCell.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//

import SwiftUI
// 카메라, 오디오 등을 제어하기 위해 사용되는 Apple의 라이브러리
import AVFoundation

struct QRCameraCell: View {
    // 카메라 화면이 들어갈 이미지
    @State private var inputImage: UIImage?
    @Binding var qrUser: String
    
    // Notification은 앱 내에서 특정상황에 값을 넘겨주고 싶을 때 해당 키로 등록되어 있는 Observer들에게 Notification을 하고 그 값을 전달할 수도 있습니다. 다만 많이 사용하게 되면 앱 성능을 저하시킬 수 있으니 주의하세요!
    // 아래 예시는 "Card Number Recognized By QR" 이라는 Notification에 대한 Observer 입니다.
    let cardNumberFromController = NotificationCenter.default
                .publisher(for: NSNotification.Name("Card Number Recognized By QR"))
    
    var body: some View {
        VStack {
            HStack {
//                Spacer().frame(width: 20)
                    
                // ViewController를 SwiftUI의 View로 변환하여 보여줍니다.
                CustomCameraRepresentable(image: self.$inputImage, qrUser: $qrUser)
                
//                Spacer().frame(width: 20)
            }
        }
        // Notification을 받으면 그 값을 cardNumber에 할당
        .onReceive(cardNumberFromController) { (output) in
            qrUser = output.object as? String ?? ""
        }
    }
}



struct CustomCameraRepresentable: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var qrUser: String
    
    // ViewController를 만들고 delegate도 설정해줍니다. ViewController가 처음 생성될때만 이 Method가 호출되고 그 후에는 아래에 있는 updateUIViewController Method가 호출됩니다.
    func makeUIViewController(context: Context) -> CustomCameraController {
        let controller = CustomCameraController()
        controller.delegate = context.coordinator
        return controller
    }
    
    // makeUIViewController Method가 ViewController가 최초 생성될 때만 호출되고 그 이후에는 updateUIViewController Method가 호출되는데, 저희는 이후에 update할일이 없으니 비워두겠습니다.
    func updateUIViewController(_ cameraViewController: CustomCameraController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Navigation, AVCapturePhotoCapture를 사용할 수 있게 delegate를 설정해줍니다.
    class Coordinator: NSObject, UINavigationControllerDelegate, AVCapturePhotoCaptureDelegate {
        let parent: CustomCameraRepresentable
        
        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
            
            if let imageData = photo.fileDataRepresentation() {
                parent.image = UIImage(data: imageData)
            }
        }
    }
}


class CustomCameraController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var image: UIImage?
    
    // 실시간 캡처 활동을 관리하고, 입력 장치의 데이터 흐름을 조정하여 출력을 캡처하는 Object
    var captureSession = AVCaptureSession()
    
    // Capture Session에 대한 입력 및 하드웨어별 캡처 기능에 대한 제어를 제공
    var backCamera: AVCaptureDevice?
    var frontCamera: AVCaptureDevice?
    var currentCamera: AVCaptureDevice?
    
    // 캡처된 결과물
    var photoOutput: AVCapturePhotoOutput?
    
    // Capture Session에서 생성된 메타데이터
    var metadataOutput: AVCaptureMetadataOutput?
    
    // 캡처된 비디오를 표시하는 Core Animation Layer
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var cardNumber: String = ""
    
    // delegate
    var delegate: AVCapturePhotoCaptureDelegate?
    
    func didTapRecord() {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: delegate!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setupCaptureSession()
        setupDevice()
        setupInputOutput()
        setupPreviewLayer()
        startRunningCaptureSession()
    }
    
    func setupCaptureSession() {
        // 출력의 품질 설정
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }
    
    // 디바이스의 어떤 카메라를 사용할지 설정. 여기서는 후면 카메라를 사용합니다.
    func setupDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)
        for device in deviceDiscoverySession.devices {
            switch device.position {
            case AVCaptureDevice.Position.front:
                self.frontCamera = device
            case AVCaptureDevice.Position.back:
                self.backCamera = device
            default:
                break
            }
        }
        self.currentCamera = self.backCamera
    }
    
    func setupInputOutput() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentCamera!)
            captureSession.addInput(captureDeviceInput)
            photoOutput = AVCapturePhotoOutput()
            
            // 출력에 대한 설정
            photoOutput?.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
            
            // Capture Session에 Output 추가
            captureSession.addOutput(photoOutput!)
            metadataOutput = AVCaptureMetadataOutput()
            
            // output에 메타데이터가 있는지 확인 후 Capture Session에 추가하는 작업입니다. 저희는 단순히 사진을 찍는것이 아닌 QR도 인식해서 값을 받아와야 하기 때문에 메타데이터도 추가해줍니다.
            if metadataOutput != nil {
                captureSession.addOutput(metadataOutput!)
                metadataOutput?.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                
                // 메타데이터의 타입은 qr이니 qr의 값을 읽어오면 추가하라는 의미입니다.
                metadataOutput?.metadataObjectTypes = [.qr]
            } else {
                return
            }
        } catch {
            print(error)
        }
        
    }
    
    // 카메라 화면이 보이는것에 대한 설정
    func setupPreviewLayer() {
        self.cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.cameraPreviewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        self.cameraPreviewLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        self.view.layer.insertSublayer(cameraPreviewLayer!, at: 0)
        
    }
    
    // Capture Session을 시작! 이 Method를 호출하면 카메라 화면이 나오며 우리가 만든 기능들을 동작시키게 됩니다.
    func startRunningCaptureSession() {
        captureSession.startRunning()
    }
    
    // 출력된 이미지를 받아와서 값을 확인 후 값이 있으면 Notification 해줍니다!
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            if cardNumber != stringValue {
                cardNumber = stringValue
                NotificationCenter.default.post(name: NSNotification.Name("Card Number Recognized By QR"), object: stringValue, userInfo: nil)
            }
        }
    }
}
