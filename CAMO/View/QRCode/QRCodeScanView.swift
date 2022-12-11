//
//  QRCodeScamView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//

import SwiftUI

struct QRCodeScanView: View {
    
    @ObservedObject var couponController = CouponController()
    
    @Binding var isPresented: Bool
    @State private var qrUser: String = ""
    
    @State private var couponActionSheet: Bool = false
    @State private var addCouponAlert: Bool = false
    @State private var useCouponAlert: Bool = false
    
    @State private var inputStampQuantity: Int = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    
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
                    QRCameraCell(qrUser: $qrUser)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 360)
//                .background(.gray)
                .cornerRadius(20)
                .padding(30)
                
                Text("My 페이지 > 회원 QR 코드 인식")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                if qrUser != "" {
                    Text("QR 스캔 완료!")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(20)
                } else {
                    Text("QR 코드를 스캔해주세요.")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(20)
                }
                Button(action: {
                    if qrUser != "" {
                        couponActionSheet.toggle()
                    }
                }, label: {
                    Text("쿠폰 적립 / 사용")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                })
                .padding(.vertical, 20)
                .background(Color("mainBrightColor"))
                .cornerRadius(16)
                .padding(.horizontal, 30)
                .confirmationDialog(
                    "쿠폰 적립 / 사용",
                    isPresented: $couponActionSheet,
                    titleVisibility: .visible,
                    actions: {
                        Button("쿠폰 적립") {
                            addCouponAlert.toggle()
                        }
                        Button("쿠폰 사용") {
                            useCouponAlert.toggle()
                        }
                        Button("취소", role: .cancel) { }
                    }
                )
                .alert("쿠폰 적립하기", isPresented: $addCouponAlert, actions: {
//                    Stepper(value: $inputStampQuantity, in: 0...10, step: 1) {
//                        Text("\(inputStampQuantity) 개")
//                    }
                    
                    TextField("적립할 쿠폰 개수", value: $inputStampQuantity, formatter: formatter)
                        .keyboardType(.decimalPad)
                        .font(.system(size: 16))
                    
                    Button("적립", action: {
                        couponController.accumulateCoupon(accumulCouponDTO: AccumulateCouponDTO(stampQuantity: inputStampQuantity, userEmail: qrUser, cafeId: cafe.cafeId))
                        
                        addCouponAlert.toggle()
                        couponActionSheet = false
                    })
                    Button("취소", role: .cancel, action: {})
                }, message: {
                    Text("적립할 쿠폰 개수 입력")
                })
                .alert("쿠폰 사용하기", isPresented: $useCouponAlert, actions: {
                    
                    Button("사용", action: {
                        couponController.useCoupon(qrUser)
                        useCouponAlert.toggle()
                        couponActionSheet = false
                    })
                    Button("취소", role: .cancel, action: {})
                }, message: {
                    Text("정말 쿠폰을 사용하시겠습니까?")
                })
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 0).ignoresSafeArea()
            .background(Color("mainColor"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear() {
            checkCameraPermission()
            
        }
    }
}
