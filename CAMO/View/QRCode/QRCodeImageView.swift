//
//  QRCodeUseView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/07.
//

import SwiftUI


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

