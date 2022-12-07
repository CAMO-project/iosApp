//
//  QRCodeScamView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/08.
//

import SwiftUI

struct QRCodeScanView: View {
    
    @Binding var isPresented: Bool
    @State private var qrUser: String = ""
    
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
                Text("회원정보: \(qrUser)")
                
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
