import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeImage: View {
    
    let context = CIContext()
    // CIFilter는 말그대로 이미지에 Filter를 씌우는 녀석이라고 보시면 됩니다. 우리는 QRCode 이미지를 만들거니깐 qrCodeGenerator() Method를 사용할게요!
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        Image(uiImage: generateQRCode(from: user.email))
            .resizable()
            .aspectRatio(1.0, contentMode: .fit)
            .clipped() //프레임을 벗어나는 이미지 제거
//            .frame(width: UIScreen.main.bounds.width - 200, height: UIScreen.main.bounds.width - 200, alignment: .center)
            .background(Color("mainPointColor"))
    }
}

extension QRCodeImage {

    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        // Key에 따라 다양한 값들을 줄 수 있어요! 높이나 너비 등 여러가지를 넣을 수 있는데 저흰 QRCode에 text를 담을꺼니깐 inputMessage라는 Key를 사용해줄겁니다!
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrCodeImage = filter.outputImage {
            // qr 이미지를 만들게 되면 해상도가 정해져있어서 좀 더 선명하게 보이도록 하기 위해 가로, 세로를 5배씩 늘려주겠습니다!
            let transform = CGAffineTransform(scaleX: 5, y: 5)
            let scaledCIImage = qrCodeImage.transformed(by: transform)
            if let qrCodeCGImage = context.createCGImage(scaledCIImage, from: scaledCIImage.extent) {
                // Image에 바로 넣을 수 있도록 UIImage로 변환해 줍니다.
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        // 변환에 실패했을 때
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}

struct QRCodeImageView: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("회원 QR 코드")
                    .font(.system(size: 22))
                    .foregroundColor(Color("mainColor"))
                    .fontWeight(.bold)
                    .padding(.vertical, 20)
                
                QRCodeImage()
//                            Image("QRImageSample")
//                                .resizable()
//                                .aspectRatio(1.0, contentMode: .fit)
//                                .clipped() //프레임을 벗어나는 이미지 제거
                    .padding(.horizontal, 80)
                
                Text("적립하려면 QR 코드를\n카페 사장님에게 보여 주세요.")
                    .lineSpacing(5)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .white))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background(Color("mainColor").opacity(0.5))
    }
}

struct QRCodeImageUseView: View {
    
    var body: some View {
        VStack {
            VStack {
                Text("회원 QR 코드")
                    .font(.system(size: 22))
                    .foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                    .padding(.vertical, 20)
                
                QRCodeImage()
//                Image("QRImageSample")
//                    .resizable()
//                    .aspectRatio(1.0, contentMode: .fit)
//                    .clipped() //프레임을 벗어나는 이미지 제거
                    .padding(.horizontal, 80)
                
                Text("쿠폰을 사용하려면 QR 코드를\n카페 사장님에게 보여 주세요.")
                    .lineSpacing(5)
                    .font(.system(size: 14))
                    .foregroundColor(Color("grayTextColor"))
                    .padding(.vertical, 20)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background(Color("mainColor").opacity(0.5))
    }
}


struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            // control points
            
            let center = rect.width / 2
//            let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 15
            
            let bottom = rect.width / 40

            let num1: CGFloat = 90
            let num2: CGFloat = 40
            
            path.move(to: CGPoint(x: center - num1, y: 0))

            let to1 = CGPoint(x: center, y: bottom + num2)
            let control1 = CGPoint(x: center - num2, y: 0)
            let control2 = CGPoint(x: center - num2, y: bottom + num2)

            let to2 = CGPoint(x: center + num1, y: 0)
            let control3 = CGPoint(x: center + num2, y: bottom + num2)
            let control4 = CGPoint(x: center + num2, y: 0)

            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)

        }
    }
    
}


struct QRCodeScanView: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Spacer(minLength: 60)
            
            VStack {
                
                ZStack {
                    
                    Text("")
                        .font(.system(size: 0))
                        .frame(maxWidth: .infinity)
                        .background(Color("mainColor").clipShape(CustomShape())
                                        .rotationEffect(.init(degrees: 180)))

                    
                    Image(systemName: "camera")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding(.top, -30)
                    
                }
//                .padding(.top, -60)
                .background(Color("mainColor"))
                
                Text("회원 QR 코드 스캔")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(20)
                
                Text("스탬프 적립을 위해 해당 고객님의 QR 코드를 스캔하세요.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                VStack {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(.gray)
                .cornerRadius(20)
                .padding(30)
                
                Text("My 페이지 > 회원 QR 코드 인식")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 0).ignoresSafeArea()
            .background(Color("mainColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            LinearGradient(gradient: Gradient(colors:
//                                                [Color.red, Color("mainColor")]),
//                           startPoint: .init(x: 0, y: -100), endPoint: .bottom))
//
    }
}
