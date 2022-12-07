//
//  CouponView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/02.
//

import SwiftUI

// MARK: ----CouponView
struct CouponView: View {
    
    @ObservedObject var couponController = CouponController()
    
    init() {
        couponController.getCouponList()
    }
    
    
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
            
            
//            VStack {
//
//                CouponRow(CouponDTO(cafeId: "dd", cafeName: "qqqq", cafeAddress: "ddd", cafeReward: "dd", cafeRewardstamp: 10, couponUserstamp: 10))
//
//                List(couponController.couponList) { couponDTO in
//                    CouponRow(couponDTO)
//                }
//                .listStyle(.plain)
//                .padding(.top, 0).ignoresSafeArea()
//                .padding(.bottom, 1)
//                .padding(.horizontal, 0).ignoresSafeArea()
//                .background(Color("bgMainColor"))
//
//
//            }
//            .padding(.top, 30)
//            .background(Color("bgMainColor"))
            
            ScrollView {
                
                ForEach(couponController.couponList) { couponDTO in
                    CouponRow(couponDTO)
                    
                }
                .padding(.top, 10)
                
            } // scrollview
            
            
        } // vstack
        //        .navigationTitle(Text("쿠폰").font(.system(size: 28)))
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("bgMainColor"))
        .onAppear() {
            self.couponController.getCouponList()
        }
        .refreshable {
            self.couponController.getCouponList()
        }
    }

    
}



struct CouponRow: View {
    
    var couponDTO : CouponDTO
    
    @State private var isActive: Bool = false
    @State private var popQrAlert: Bool = false
    @State private var popColorAlert: Bool = false
    
    init(_ couponDTO: CouponDTO) {
        self.couponDTO = couponDTO
    }
    
    var body: some View {
        
        VStack {
            
            ZStack {

                NavigationLink(destination: CafeInfoView(couponDTO.cafeId), isActive: $isActive) {
                    EmptyView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(0.0)
                .buttonStyle(PlainButtonStyle())
                VStack{
                    Spacer(minLength: 0)
                    HStack {
                        VStack (alignment: .leading) {
                            Text("\(couponDTO.cafeName)").font(.system(size: 16))
                                .padding(.bottom, 10)
                            Text("\(couponDTO.cafeAddress)").font(.system(size: 12))
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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.vertical, 20)
                        
                        Spacer(minLength: 20)
                        
                        VStack {
                            Text("\(couponDTO.couponUserstamp) / \(couponDTO.cafeRewardstamp)")
                                .font(.system(size: 14))
                        }
                        .frame(maxWidth: 50, maxHeight: .infinity ,alignment: .trailing)
                        .padding(.trailing, 20)
                        
                    } // hstack
                    
                }// vstack
                .onTapGesture {
                    isActive.toggle()
                    
                }
                
            } // zstack
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
        

            if (couponDTO.couponUserstamp >= couponDTO.cafeRewardstamp) {
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
                
        } // vstack
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
