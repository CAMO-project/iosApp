//
//  CreateCafeView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/13.
//

import SwiftUI

struct EditCafeView: View {
    var body: some View {
        Text("EditCafe")
    }
}

struct CreateCafeView: View {
    
    @State var inputCafeName: String = ""
    @State var inputCafeAddress: String = ""
    @State var inputCafePhone: String = ""
    @State var inputBusinessNum: String = ""
    
    @State private var textMsg = true
    @State private var textWrongPW = true
    
    @Binding var isPresented: Bool
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("카페명").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputCafeName, textField: nameView, placeholder: "카페 상호명을 입력하세요")
                    .padding(.bottom, 32)
                
                Text("주소").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputCafeAddress, textField: addressView, placeholder: "카페 주소를 입력하세요")
                    .padding(.bottom, 32)
                
                Text("전화번호").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputCafePhone, textField: phoneView, placeholder: "카페 전화번호를 입력하세요")
                    .padding(.bottom, 32)
                
                Text("사업자 등록 번호").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputBusinessNum, textField: businessNumView, placeholder: "사업자 번호를 입력하세요")
                    .padding(.bottom, 32)
                
                if (!textMsg) {
                    Text("모든 칸을 필수로 입력해주세요").font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                }
            }
            
        } // scrollview
        .padding(.top, 30)
        .padding(.horizontal, 30)
        .navigationTitle("카페 등록하기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            self.isPresented = false
        }, label: {
            Text("취소")
        }), trailing: Button(action: {
            if (inputCafeName == "" || inputCafeAddress == "" || inputCafePhone == ""  || inputBusinessNum == "") {
                // 하나라도 빈칸이 있는 경우
                textMsg = false
            } else {
                cafeRegister(cafe: Cafe(cafeId: inputBusinessNum, cafeName: inputCafeName, cafeAddress: inputCafeAddress, cafePhone: inputCafePhone))
                self.isPresented = false
            }
        }, label: {
            Text("확인")
        }))
        .background(Color("bgMainColor"))
    } // body
}

extension CreateCafeView {
    
    private var nameView: some View {
         TextField("", text: $inputCafeName)
            .font(.system(size:16))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }
    
    private var addressView: some View {
        TextField("", text: $inputCafeAddress)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var phoneView: some View {
        TextField("", text: $inputCafePhone)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var businessNumView: some View {
        TextField("", text: $inputBusinessNum)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
}


struct EditCafeInfoView: View {
    
    @State var inputCafeName: String = cafe.cafeName
    @State var inputCafeAddress: String = cafe.cafeAddress
    @State var inputCafePhone: String = cafe.cafePhone
    @State var inputCouponTotal: Int = cafe.stampsNumber
    @State var inputCouponReward: String = cafe.cafeReward
    @State var inputCafeIntroduce: String = cafe.cafeIntroduce
    
    
    @State private var textMsg = true
    @State private var textWrongPW = true
    
    @State var placeHolder : String = "카페 소개글 작성하기"
    
    @Binding var isPresented: Bool
    
//    init() {
//        isPresented = true
//        UITextView.appearance().backgroundColor = .clear
//    }
    
    
    var body: some View {
        
        ScrollView {
            
            Image("testImage1")
//                    .renderingMode(.original)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .clipped() //프레임을 벗어나는 이미지 제거
                .padding(.bottom, 20)
                .padding(.horizontal, 30)
            
            VStack(alignment: .leading) {
                Label {
                    Text("카페명을 입력하세요")
                        .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                        .fontWeight(.bold)
                } icon : {
                    Image(systemName: "cup.and.saucer")
                        .environment(\.symbolVariants, .none)
                        .font(.system(size: 18))
                        .foregroundColor(Color("mainPointColor"))
                }
                
                UnderlineTextFieldView(text: $inputCafeName, textField: nameView, placeholder: "카페 상호명을 입력하세요")
                    .padding(.bottom, 32)
                
                Label {
                    Text("카페 주소를 입력하세요")
                        .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                        .fontWeight(.bold)
                } icon : {
                    Image(systemName: "map")
                        .environment(\.symbolVariants, .none)
                        .font(.system(size: 18))
                        .foregroundColor(Color("mainPointColor"))
                }
                UnderlineTextFieldView(text: $inputCafeAddress, textField: addressView, placeholder: "카페 주소를 입력하세요")
                    .padding(.bottom, 32)
                
                Label {
                    Text("카페 전화번호를 입력하세요")
                        .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                        .fontWeight(.bold)
                } icon : {
                    Image(systemName: "phone")
                        .environment(\.symbolVariants, .none)
                        .font(.system(size: 18))
                        .foregroundColor(Color("mainPointColor"))
                }
                UnderlineTextFieldView(text: $inputCafePhone, textField: phoneView, placeholder: "카페 전화번호를 입력하세요")
                    .padding(.bottom, 32)
             
                
                VStack(alignment: .leading) {
                    Label {
                        Text("모아야하는 스탬프 수")
                            .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                            .fontWeight(.bold)
                    } icon : {
                        Image(systemName: "heart.circle")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 18))
                            .foregroundColor(Color("mainPointColor"))
                    }
                    
                    Stepper(value: $inputCouponTotal, in: 0...20, step: 1) {
                        Text("\(inputCouponTotal) 개")
                    }
                    .padding(.bottom, 32)
                    
                    Label {
                        Text("쿠폰 보상")
                            .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                            .fontWeight(.bold)
                    } icon : {
                        Image(systemName: "gift")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 18))
                            .foregroundColor(Color("mainPointColor"))
                    }
                    UnderlineTextFieldView(text: $inputCouponReward, textField: couponGiftView, placeholder: "쿠폰 보상을 입력하세요")
                        .padding(.bottom, 32)
                    
                    Label {
                        Text("사장님의 한마디를 적어주세요.\n(인사말, 공지사항 등)")
                            .font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                            .fontWeight(.bold)
                            .lineSpacing(5)
                    } icon : {
                        Image(systemName: "quote.bubble")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 18))
                            .foregroundColor(Color("mainPointColor"))
                    }
                }

            }
            .padding(.horizontal, 30)
            
                
            VStack {
                
                // 텍스트 작성
                TextEditor(text: $inputCafeIntroduce)
                    .font(.system(size: 18))
                    .lineSpacing(5)
                    .frame(maxWidth: .infinity, minHeight: 300)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .padding(.top, 10).ignoresSafeArea()
                    // 여기
                    .scrollContentBackground(.hidden)
                    .background(Color("bgColor"))
                if inputCafeIntroduce.isEmpty {
                    Text(placeHolder)
                        .font(.system(size: 18))
                        .foregroundColor(Color("grayTextColor"))
                        .lineSpacing(5)
                        .padding(.top, 18).ignoresSafeArea()
                        .padding(.horizontal, 24)
                }
            }
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .padding(.horizontal, 30)
            .padding(.top, 0).ignoresSafeArea()
                
                
            VStack {
                if (!textMsg) {
                    Text("모든 칸을 필수로 입력해주세요").font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 30)
            
        } // scrollview
        .navigationTitle("카페 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            self.isPresented = false
        }, label: {
            Text("취소")
        }), trailing: Button(action: {
            if (inputCafeName == "" || inputCafeAddress == "" || inputCafePhone == ""
                       || inputCouponReward == "" || inputCafeIntroduce == "") {
                // 하나라도 빈칸이 있는 경우
                textMsg = false
            } else {
                cafeUpdate(editCafeDTO: EditCafeDTO(cafeName: inputCafeName, cafeAddress: inputCafeAddress, cafePhone: inputCafeAddress, cafeIntroduce: inputCafeIntroduce, cafeReward: inputCouponReward, stampsNumber: inputCouponTotal))
                self.isPresented = false
            }
        }, label: {
            Text("확인")
        }))
        .background(Color("bgPointColor"))
    } // body
}

extension EditCafeInfoView {
    
    private var nameView: some View {
         TextField("", text: $inputCafeName)
            .font(.system(size:16))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }
    
    private var addressView: some View {
        TextField("", text: $inputCafeAddress)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var phoneView: some View {
        TextField("", text: $inputCafePhone)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var couponGiftView: some View {
        TextField("", text: $inputCouponReward)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var cafeIntroView: some View {
        TextField("", text: $inputCafeIntroduce)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    
    
}


