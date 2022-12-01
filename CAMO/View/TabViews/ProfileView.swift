//
//  ProfileView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/02.
//

import SwiftUI


// MARK: ----ProfileView
struct ProfileView: View {
    
    @State var editUserInfo: Bool = false
    @State private var popQrAlert: Bool  = false
    @State private var qrScanSettings: Bool = false
    
    @State var createCafe = false
    @State var editCafeInfo = false
    @State var editCafeMenu = false
    
    @State var userInfo: User = getUser()
    @State var cafeInfo: Cafe = getCafe()
    
//    var userInfo = User()
//    var cafeInfo : Cafe = cafe
    
    var body: some View {
        VStack {
            
            VStack {
                Text("My 페이지")
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 30)
            .padding(.bottom, 0)
            
            ScrollView {
                
                // 회원정보 박스
                VStack {
                    ZStack {
                        Text("My Page")
                            .font(.system(size: 18))
                            .foregroundColor(Color("mainPointColor"))
                        HStack {
                            Spacer()
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 20))
                                .foregroundColor(Color(UIColor.systemBlue))
                                .onTapGesture {
                                    editUserInfo = true
                                }
                                .fullScreenCover(isPresented: $editUserInfo) {
                                    NavigationView {
                                        EditUserInfoView(isPresented: $editUserInfo)
                                            .navigationBarBackButtonHidden(false)
                                    }
                                }
                        }
                    }
                    .padding(20)
                    
                    VStack {
                        HStack {
                            Text("이름")
                                .font(.system(size: 14))
//                                .fontWeight(.bold)
                            Spacer()
                            Text(userInfo.name)
                                .foregroundColor(Color("grayTextColor"))
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("이메일")
                                .font(.system(size: 14))
//                                .fontWeight(.bold)
                            Spacer()
                            Text(userInfo.email)
                                .foregroundColor(Color("grayTextColor"))
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("전화번호")
                                .font(.system(size: 14))
//                                .fontWeight(.bold)
                            Spacer()
                            Text(userInfo.phone)
                                .foregroundColor(Color("grayTextColor"))
                                .font(.system(size: 14))
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("회원")
                                .font(.system(size: 14))
//                                .fontWeight(.bold)
                            Spacer()
                            if (userInfo.role == 1) {
                                Text("카페 사장님")
                                    .foregroundColor(Color("grayTextColor"))
                                    .font(.system(size: 14))
                            } else {
                                Text("일반 회원")
                                    .foregroundColor(Color("grayTextColor"))
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        
                        
                    }
                    .padding(.bottom, 10)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color("bgColor"))
                .border(Color.black.opacity(0), width: 0)
                .cornerRadius(20)
                .padding(30)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("회원 QR 코드")
                            .font(.system(size: 18))
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.bottom, 10)
                        
                        Text("적립하려면 QR 코드를\n카페 사장님에게 보여 주세요.")
                            .lineSpacing(5)
                            .font(.system(size: 14))
                            .foregroundColor(Color("grayTextColor"))
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    VStack {
//                        Image("QRImageSample")
                        QRCodeImage()
//                            .resizable()
//                            .aspectRatio(1.0, contentMode: .fit)
//                            .clipped() //프레임을 벗어나는 이미지 제거
                    }
                    .frame(maxWidth: 100, maxHeight: 100)
                    .padding(20)
                        
                }
                .frame(maxWidth: .infinity)
                .background(Color("bgColor"))
                .border(Color.black.opacity(0), width: 0)
                .cornerRadius(20)
                .padding(.horizontal, 30)
                .padding(.top, 0).ignoresSafeArea()
                .padding(.bottom, 30)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                .onTapGesture {
                    popQrAlert = true
                }
                .sheet(isPresented: $popQrAlert) {
                    QRCodeImageView()
                }
                
//                EditCafeRow(userRole: userInfo["회원"] ?? "일반 회원", cafeName: "")
                VStack {
                    if (userInfo.role == 0) {
                        VStack {
                            Text("카페 사장님이신가요?")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.bottom, 10)
                            
                            Button {
                                createCafe = true
                            } label: {
                                Text("카페 등록하러 가기")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                            }
                            .padding(.vertical, 20)
                            .background(Color("mainColor"))
                            .cornerRadius(16)
                            .fullScreenCover(isPresented: $createCafe) {
                                NavigationView {
                                    CreateCafeView(isPresented: $createCafe)
                                    //                        .navigationBarHidden(false)
                                        .navigationBarBackButtonHidden(false)
                                }
                                
                            }
                            
                            
                        }
                        .padding(.horizontal, 30)
                        
                    } else if (userInfo.role == 1) {
                        VStack {
                            Text("카페 \(cafeInfo.cafeName)")
                                .font(.system(size: 18))
                                .foregroundColor(Color("mainPointColor"))
                                .padding(.bottom, 10)
                                .padding(.top, 20)
                            
                            HStack {
                                
                                // 카페 정보 수정 버튼
                                Button {
                                    editCafeInfo = true
                                } label: {
                                    VStack {
                                        Image(systemName: "book")
                                            .environment(\.symbolVariants, .none)
                                            .font(.system(size: 24))
                                            .foregroundColor(Color("mainPointColor"))
                                            .padding(.bottom, 10)
                                        
                                        Text("카페 정보")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color("mainPointColor"))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 20)
                                    .background(Color("bgColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                        
                                    )
                                    
                                }
                                .padding(.trailing, 10)
                                .fullScreenCover(isPresented: $editCafeInfo) {
                                    NavigationView {
                                        EditCafeInfoView(isPresented: $editCafeInfo)
                                            .navigationBarBackButtonHidden(false)
                                    }
                                }
                                
                                
                                // 카페 메뉴 수정 버튼
                                Button {
                                    editCafeMenu = true
                                } label: {
                                    VStack {
                                        Image(systemName: "drop")
                                            .environment(\.symbolVariants, .none)
                                            .font(.system(size: 24))
                                            .foregroundColor(Color("mainPointColor"))
                                            .padding(.bottom, 10)
                                        
                                        Text("카페 메뉴")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color("mainPointColor"))
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 20)
                                    .background(Color("bgColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                        
                                    )
                                    
                                }
                                .padding(.leading, 10)
                                
                                
                                
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                            
                            
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color("bgColor"))
                        .border(Color.black.opacity(0), width: 0)
                        .cornerRadius(20)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                        .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                    }
                }
                
                HStack {
                    Button {
                    } label: {
                        Text("로그아웃")
                            .font(.system(size: 14))
                            .foregroundColor(Color("grayTextColor"))
                    }
                    .frame(maxWidth: .infinity)
                    
                    Divider()
                    
                    Button {
                    } label: {
                        Text("회원탈퇴")
                            .font(.system(size: 14))
                            .foregroundColor(Color("grayTextColor"))
                            .onTapGesture {
                                deleteUser()
                                StartView()
                            }
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 60)
                .padding(.bottom, 30)
                .padding(.horizontal, 30)
            } // scrollview
            
            
            
            if (userInfo.role == 1) {

                ZStack {

                    Text("")
                        .font(.system(size: 0))
                        .frame(maxWidth: .infinity)
                        .ignoresSafeArea(.all, edges: .all)
                        .background(Color("mainColor").clipShape(CustomShape())
                                        .rotationEffect(.init(degrees: 180)))

                    Image(systemName: "camera")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding(.top, -30)
                }
                .background(Color("mainColor"))
                .onTapGesture {
                    qrScanSettings = true
                }
                .sheet(isPresented: $qrScanSettings) {
                    QRCodeScanView(isPresented: $qrScanSettings)
                }

            }
        } // vstack
        .background(Color("bgMainColor"))
        .refreshable {
            userInfo = getUser()
            cafeInfo = getCafe()
//            print("새로고침 : \(user)")
            print("새로고침: \(userInfo)")
        }
        .onAppear() {
//            userInfo = getUserWithReturn()
//            cafeInfo = getCafeWithReturn()
//            print("appear :)")
//            print("cafeInfo : \(cafeInfo)")
        }
//        .onDisappear() {
//            print("disappear :)")
//        }
        
    }
    
}
