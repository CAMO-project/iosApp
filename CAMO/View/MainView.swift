//
//  MainView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/08.
//

import SwiftUI

struct MainView: View {
    
    private enum Tabs {
        case CafeList, Coupon, Profile
    }

    @State private var selectedTab: Tabs = .CafeList

    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()

        UITabBar.appearance().backgroundColor = UIColor(Color("bgMainColor"))
        UITabBar.appearance().standardAppearance = appearance
        }
    
    
    
    var body: some View {
        
//        TabView(selection: $selectedTab) {
//            Group {
//                CafeListUI
//                CouponUI
//                ProfileUI
//            }
//        }
        TabView(selection: $selectedTab) {
            CafeListView()
                .tag(Tabs.CafeList)
                .tabItem({
                    Image(systemName: "cup.and.saucer")
                        .environment(\.symbolVariants, .none)
                    Text("cafe")
                })
            CouponView()
                .tag(Tabs.Coupon)
                .tabItem {
                    Image(systemName: "heart.circle")
                        .environment(\.symbolVariants, .none)
                    Text("coupon")
                }
            ProfileView()
                .tag(Tabs.Profile)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .environment(\.symbolVariants, .none)
                    Text("profile")
                }
        }
        .accentColor(Color("mainPointColor"))

            
            
//            .toolbarBackground(.red, for: .tabBar)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct CafeListView: View {

    @State private var inputSearch: String = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("카페 리스트")
                    .font(.system(size: 32))
                    .fontWeight(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 30)
            .padding(.bottom, 0)
            
            // 검색
            HStack {
                TextField("검색", text: $inputSearch)
                    .padding(.leading, 20)
                    .padding(.vertical, 10)
                    .font(.system(size:16))
                    .textInputAutocapitalization(.never)
                Image(systemName: "magnifyingglass")
                    .environment(\.symbolVariants, .none)
                    .imageScale(.medium)
                    .foregroundColor(Color("mainPointColor"))
                    .padding(.trailing, 20)
                    .padding(.vertical, 10)
            } // hstack
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(10)
            .padding(30)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)

            
            
            List {
//                ForEach(1..<100) {
//                    Text("item \($0)")
//                }
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
//                        .listRowInsets(EdgeInsets())
                CafeListRow(businessNum: "2222", cafeName: "포롱", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "3333", cafeName: "프린세스", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "4444", cafeName: "헬로베이비", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
                CafeListRow(businessNum: "1111", cafeName: "베이그", cafeAddress: "충청남도 천안시 서북구 천안대로 1223-24 (우)31080", ratingNum: 4.3)
            }
            .listStyle(.plain)
            .padding(.horizontal, 30)
            .padding(.top, 0).ignoresSafeArea()
            .padding(.bottom, 1)
            .background(Color("bgMainColor"))
            
            
        } // vstack
        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle(Text("카페 리스트").font(.system(size: 28)))
        .background(Color("bgMainColor"))
        
    }
}

// MARK: ----CouponView
struct CouponView: View {
    
    var body: some View {
//        VStack {
//            Text("Coupon!!")
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.yellow)
        
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

// MARK: ----ProfileView
struct ProfileView: View {
    
    @State var editUserInfo: Bool = false
    @State private var popQrAlert: Bool  = false
    @State private var qrScanSettings: Bool = false
    
    @State var createCafe = false
    @State var editCafeInfo = false
    @State var editCafeMenu = false
    
    @State var userInfo: User = getUserWithReturn()
    @State var cafeInfo: Cafe = getCafeWithReturn()
    
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
//            self.userViewModel.refreshUser()
            userInfo = getUserWithReturn()
            cafeInfo = getCafeWithReturn()
            print("새로고침 : \(user)")
        }
        .onAppear() {
//            self.userViewModel.refreshUser()
            userInfo = getUserWithReturn()
            cafeInfo = getCafeWithReturn()
            print("appear :) \(userInfo)")
        }
        .onDisappear() {
            print("disappear :)")
        }
        
    }
    
}


struct CafeListRow: View {
    
    @State var businessNum : String
    @State var cafeName : String
    @State var cafeAddress : String
    @State var ratingNum : Float
    
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            
            NavigationLink(destination: CafeInfoView(businessNum: $businessNum, cafeName : $cafeName, cafeAddress : $cafeAddress), isActive: $isActive) {
                EmptyView()
            } //navigationlink
            .opacity(0.0)
//            .hidden()
            .buttonStyle(PlainButtonStyle())
            
            VStack (alignment: .leading) {
                HStack {
                    Text("\(cafeName)").font(.system(size: 16))
                    Spacer()
                    HStack {
                        Image(systemName: "star.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 14))
                            .foregroundColor(.yellow)
                        Text("\(ratingNum, specifier: "%.1f")")
                            .font(.system(size: 14))
                    } // hstack
                } // hstack
                .padding(.bottom, 10)
                Text("\(cafeAddress)").font(.system(size: 12))
                    .foregroundColor(Color("grayTextColor"))
            } // vstack
            .padding(.vertical, 20)
        }
        .background(Color("bgMainColor"))
        .listRowBackground(Color("bgMainColor"))
        
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


struct EditUserInfoView: View {
    
    @Binding var isPresented: Bool
    
    @State var inputUserName: String = user.name
    @State var inputUserPhone: String = user.phone
    @State var inputPW: String = ""
    @State var inputPWChk: String = ""
    
    @State private var textMsg = true
    @State private var textWrongPW = true
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("이름").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputUserName, textField: nameView, placeholder: "이름을 입력하세요")
                    .padding(.bottom, 32)
                
                Text("전화번호").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputUserPhone, textField: phoneView, placeholder: "전화번호를 입력하세요 ('-' 제외)").padding(.bottom, 32)
                
                Text("비밀번호").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputPW, textField: passwordView, placeholder: "비밀번호를 입력하세요")
                    .padding(.bottom, 32)
                
                Text("비밀번호 확인").font(.system(size:16)).foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                UnderlineTextFieldView(text: $inputPWChk, textField: passwordChkView, placeholder: "비밀번호를 다시 입력하세요")
                    .padding(.bottom, 32)
            }
            
            VStack {
                if (!textWrongPW) {
                    Text("비밀번호가 서로 일치하지 않습니다").font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                        .padding(.bottom, 20)
                    
                }
                
                if (!textMsg) {
                    Text("모든 칸을 필수로 입력해주세요").font(.system(size: 14))
                        .foregroundColor(Color("redPointColor"))
                }

            }
            
        } // scrollView
        .padding(.top, 30)
        .padding(.horizontal, 30)
        .navigationTitle("정보 수정")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            self.isPresented = false
        }, label: {
            Text("취소")
        }), trailing: Button(action: {
            if (inputUserName == "" || inputUserPhone == ""
                       || inputPW == "" || inputPWChk == "") {
                // 하나라도 빈칸이 있는 경우
                textMsg = false
            } else if (inputPW != inputPWChk && inputPW != "") {
                textWrongPW = false
            } else {
                editUserInfo(editUserDTO: EditUserDTO(name: inputUserName, password: inputPW, phone: inputUserPhone))
                self.isPresented = false
            }
        }, label: {
            Text("확인")
        }))
        .onAppear() {
            print("appear editUserInfo ◡̎")
        }
        .onDisappear() {
            print("disappear editUserInfo ◡̎")
        }
        .background(Color("bgMainColor"))
        
    } // body
}



extension EditUserInfoView {

    private var nameView: some View {
         TextField("", text: $inputUserName)
            .font(.system(size:16))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }

     private var passwordView: some View {
          SecureField("", text: $inputPW)
             .font(.system(size:16))
             .disableAutocorrection(true)
             .textInputAutocapitalization(.never)
     }
    
    private var passwordChkView: some View {
         SecureField("", text: $inputPWChk)
            .font(.system(size:16))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }
    
    private var phoneView: some View {
         TextField("", text: $inputUserPhone)
            .font(.system(size:16))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
    }
}





extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

