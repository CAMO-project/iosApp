//
//  SettingsView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/07.
//

import SwiftUI
import Foundation
import Alamofire

struct LoginView: View {
    
    // id == 이메일
    @State private var inputUserID: String = ""
    @State private var inputUserPW: String = ""
    
    
    @State private var wrongInput = false
//    @State private var popAlert = false
    
    @Binding var isPresented: Bool
    @Binding var isLogined: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle().frame(height:0)
            Text("로그인").font(.system(size: 24)).fontWeight(.black)
            Spacer().frame(height:70)
            VStack(alignment: .leading) {
                
                UnderlineTextFieldView(text: $inputUserID, textField: idView, placeholder: "아이디를 입력하세요")
                    .padding(.bottom, 32)
                
                UnderlineTextFieldView(text: $inputUserPW, textField: pwView, placeholder: "비밀번호를 입력하세요")
                
            
            }
            
            VStack {
                
                if (wrongInput) {
                    Text("아이디나 비밀번호가 일치하지 않습니다" + inputUserID + inputUserPW)
                        .font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                }
            }
            .padding(.bottom, 70)
            
            Button {
                if (inputUserID != "" && inputUserPW != "") {
                    isLogined = login(loginDTO: LoginDTO(email: inputUserID, password: inputUserPW))
                    print("버튼 클릭 \(isLogined)")
//                    isLogined = true
                    
                    if (isLogined == true) {
                        isPresented = false
                    } else {
                        wrongInput = true
                    }
                } else {
                    wrongInput = true
                }
                
//                if (inputUserID == "1234" && inputUserPW == "1234") {
//                    // 값이 일치하는 경우
////                    popAlert = true
////                    successLogin = true
//                    isLogined = true
////                    NavigationLink("", destination: MainView())
////                        .navigationBarHidden(false)
////                        .navigationBarBackButtonHidden(true)
//                    isPresented = false
//                } else {
//                    wrongInput = true
//                }
            } label: {
                Text("로그인")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 20)
            .background(Color("mainColor"))
            .cornerRadius(16)
            
            
//            .alert(isPresented: $popAlert) {
//                Alert(title: Text("로그인 완료!"), message: nil,
//                                  dismissButton: .default(Text("확인")))
//            }
            
        }
        .padding(30)
        .onDisappear() {
            isPresented = false
        }

        
    }
}

extension LoginView {
    private var idView: some View {
        TextField("", text: $inputUserID)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
    
    private var pwView: some View {
        SecureField("", text: $inputUserPW)
           .font(.system(size:16))
           .disableAutocorrection(true)
           .textInputAutocapitalization(.never)
    }
}
