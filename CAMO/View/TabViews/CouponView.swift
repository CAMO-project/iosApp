//
//  CouponView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/02.
//

import SwiftUI

// MARK: ----CouponView
struct CouponView: View {
    
    var body: some View {
        
        VStack {
            
            VStack {
                Text("쿠폰 리스트")
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 30)
            .padding(.bottom, 0)
        
            
            ScrollView {
                
                VStack {
                    CouponRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 8, couponMy: 4)
                    CouponRow(businessNum: "2222", cafeName: "포롱", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 2)
                    CouponRow(businessNum: "1111", cafeName: "프린세스", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 10)
                    CouponRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 8, couponMy: 4)
                    CouponRow(businessNum: "2222", cafeName: "포롱", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 2)
                    CouponRow(businessNum: "1111", cafeName: "프린세스", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 10)
                    CouponRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 8, couponMy: 4)
                    CouponRow(businessNum: "2222", cafeName: "포롱", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 2)
                    CouponRow(businessNum: "1111", cafeName: "프린세스", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", couponTotal: 10, couponMy: 10)
                }
                .padding(.top, 30)
                .background(Color("bgMainColor"))
                
            } // scrollView
            .background(Color("bgMainColor"))
        } // vstack
//        .navigationTitle(Text("쿠폰").font(.system(size: 28)))
        .background(Color("bgMainColor"))
        
    }
    
}



struct CouponRow: View {
    
    @State var businessNum : String
    @State var cafeName : String
    @State var cafeAddress : String
    @State var couponTotal : Int
    @State var couponMy : Int
    
    @State private var isActive: Bool = false
    @State private var popQrAlert: Bool = false
    @State private var popColorAlert: Bool = false
    
    @State private var userEmail: String = "fsfldfjsljfsl"
    
    var body: some View {
        VStack {

            NavigationLink(destination: CafeInfoView(businessNum: $businessNum, cafeName : $cafeName, cafeAddress : $cafeAddress), isActive: $isActive) {
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(cafeName)").font(.system(size: 16))
                            .padding(.bottom, 10)
                        Text("\(cafeAddress)").font(.system(size: 12))
                            .foregroundColor(Color("grayTextColor"))
                            .lineLimit(1)
                            .padding(.bottom, 10)
                        Label {
                            // 쿠폰보상
                            Text("아이스 아메리카노")
                                .font(.system(size: 12))
                                .lineLimit(1)
                                .foregroundColor(Color("grayTextColor"))
                        } icon : {
                            Image(systemName: "gift")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 14))
                                .foregroundColor(Color("redPointColor"))
                        }
                    } // vstack
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 20)
                    .padding(.vertical, 20)
                    
                    VStack {
                        Text("\(couponMy) / \(couponTotal)")
                            .font(.system(size: 14))
                    }
                    .frame(maxWidth: 50, maxHeight: .infinity ,alignment: .trailing)
                    .padding(.trailing, 20)
                
                } // hstack
                    
                    
            } // navigationLink
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .onLongPressGesture(minimumDuration: 2.0) { isPressing in
                // press start -> min duration
                if isPressing {
                    popColorAlert.toggle()
                }
            } perform: {
            // 구현할 동작
            }

            if (couponMy >= couponTotal) {
                VStack {
                    Text("쿠폰 사용하기")
                        .font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                        .padding(.vertical, 10)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    popQrAlert = true
                }
                .sheet(isPresented: $popQrAlert) {
                    QRCodeImageUseView()
                }
                
                
                
            }
                
        } // zstack
        .frame(maxWidth: .infinity)
        .background(Color("bgColor"))
        .border(Color.black.opacity(0), width: 0)
        .cornerRadius(20)
        .padding(.horizontal, 30)
        .padding(.bottom, 20)
        .padding(.top, 0).ignoresSafeArea()
        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
        
            
    } // body
}
