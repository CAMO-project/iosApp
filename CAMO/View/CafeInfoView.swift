//
//  CafeInfoView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/10.
//

import SwiftUI

struct CafeInfoView: View {
    
    @Binding var businessNum : String
    @Binding var cafeName : String
    @Binding var cafeAddress : String
    
    @State private var isActiveMenu: Bool = false
    @State private var isActiveWrite: Bool = false
    
    // 주소, 전화번호, 쿠폰, 한줄소개
//    @State private var cafeAdress : String

    @State var reviewSettings = false
    
    var body: some View {
        ScrollView {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text("사업자번호 : \(businessNum)")
//            Text("카페 이름 : \(cafeName)")
            VStack {
                Image("testImage1")
//                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .clipped() //프레임을 벗어나는 이미지 제거
                
                VStack(alignment: .leading) {
                    Label {
                        // 지도
                        Text("\(cafeAddress)")
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                    } icon : {
                        Image(systemName: "map")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 16))
                            .foregroundColor(Color("mainPointColor"))
                    }
                    .padding(.bottom, 20)
                    Label {
                        // 전화번호
                        Text("111-222-3333")
                            .font(.system(size: 14))
                    } icon : {
                        Image(systemName: "phone")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 16))
                            .foregroundColor(Color("mainPointColor"))
                    }
                    .padding(.bottom, 20)
                    HStack {
                        Label {
                            // 쿠폰개수
                            Text("스탬프 0/8")
                                .font(.system(size: 14))
                        } icon : {
                            Image(systemName: "heart.circle")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 16))
                                .foregroundColor(Color("mainPointColor"))
                        }
                        .padding(.trailing, 20)
                        
                        Label {
                            // 쿠폰보상
                            Text("5000원 이하 음료 가능")
                                .font(.system(size: 12))
                                .lineLimit(1)
                                .foregroundColor(Color("grayTextColor"))
                        } icon : {
                            Image(systemName: "gift")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 14))
                                .foregroundColor(Color("redPointColor"))
                        }
                        Spacer()
                        
                        
                    }
                    .padding(.bottom, 20)
                    Label {
                        // 한줄소개
                        Text("안녕하세요. 카페 베이그입니다 :) \n 편하게 와서 쉬다 가세요~ \n 공지사항 : 10/08 휴무입니다.")
                            .font(.system(size: 14))
                            .lineSpacing(5)
                    } icon : {
                        Image(systemName: "quote.bubble")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 16))
                            .foregroundColor(Color("mainPointColor"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)

            } // vstack
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .padding(30)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            
                
        
            // 대표 메뉴
            
            NavigationLink(destination: menuListView(businessNum: $businessNum), isActive: $isActiveMenu) {
                VStack {  // menu box
                    ZStack {
                        Text("대표 메뉴")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainPointColor"))
                        HStack {
                            Spacer()
                            Text("더보기")
                                .font(.system(size: 14))
                                .foregroundColor(Color(UIColor.systemBlue))
//                                .frame(width: .infinity, alignment: .trailing)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                    }
                    .padding(20)
                    
                    HStack {
                        VStack {
                            Image("testImage2")
            //                    .renderingMode(.original)
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .clipped() //프레임을 벗어나는 이미지 제거
                            
                            Text("아이스 아메리카노")
                                .font(.system(size: 14))
                                .lineLimit(1)
                                .padding(.top, 10)
                                .padding(.bottom, 1).ignoresSafeArea()
                            Text("2500원")
                                .font(.system(size: 12))
                                .foregroundColor(Color("grayTextColor"))
                        }
                        .padding(.trailing, 5)
                        VStack {
                            Image("testImage3")
            //                    .renderingMode(.original)
                                .resizable()
                                .aspectRatio(1.0, contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .clipped() //프레임을 벗어나는 이미지 제거
                            
                            Text("아이스 아메리카노")
                                .font(.system(size: 14))
                                .lineLimit(1)
                                .padding(.top, 10)
                                .padding(.bottom, 1).ignoresSafeArea()
                            Text("2500원")
                                .font(.system(size: 12))
                                .foregroundColor(Color("grayTextColor"))
                        }
                        .padding(.leading, 5)
                    } // hstack
                    .padding(.horizontal, 20)
                    .padding(.top, 0).ignoresSafeArea()
                    .padding(.bottom, 20)
                    
                    
                } // vstack
                
            } // navigationLink
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .padding(.horizontal, 30)
            .padding(.vertical, 0).ignoresSafeArea()
            
            
            // 별점 및 리뷰
            
            VStack {
                
                // 버튼
//                NavigationLink(destination: WriteReView(cafeName: $cafeName), isActive: $isActiveWrite) {
//                    Label {
//                        Text("별점 및 리뷰 남기기")
//                            .font(.system(size: 16))
//                            .foregroundColor(.white)
//                    } icon : {
//                        Image(systemName: "pencil")
//                            .environment(\.symbolVariants, .none)
//                            .font(.system(size: 18))
//                            .foregroundColor(.white)
//                    }
//                    .frame(maxWidth: .infinity)
//
//                }
//                .padding(.vertical, 20)
//                .background(Color("mainColor"))
//                .cornerRadius(16)
                
                Button {
                    reviewSettings = true
                } label: {
                    Label {
                        Text("별점 및 리뷰 남기기")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    } icon : {
                        Image(systemName: "pencil")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)

                }
                .padding(.vertical, 20)
                .background(Color("mainColor"))
                .cornerRadius(16)
                .fullScreenCover(isPresented: $reviewSettings) {
                    NavigationView {
                        WriteReView(isPresented: $reviewSettings, cafeName: $cafeName)
    //                        .navigationBarHidden(false)
                            .navigationBarBackButtonHidden(false)
                    }
                    
                }
                
                HStack {
                    StarsView(rating: 3.5)
                }
                
                
            } // vstack
            .padding(30)
          
        } // scrollView
        .navigationTitle("\(cafeName)")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("bgMainColor"))
    }
}

//struct CafeInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeInfoView()
//    }
//}


// CafeInfoView -> 메뉴 더보기 뷰
struct menuListView: View {
    
    @Binding var businessNum : String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("\(businessNum)")
    }
}



fileprivate struct SaveBtn: View {
    @Binding var isPresented : Bool
    
    var body: some View {
        Button(action: {
            self.isPresented = false
        }, label: {
            Text("확인")
        })
    }
}


//
// CafeInfoView -> 리뷰 작성하기 뷰
struct WriteReView: View {
    
    
    @Binding var isPresented: Bool
    @Binding var cafeName : String

    @State var ratingValue : Int = 5

    var maxRating = 5

    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    @State var inputReview : String = ""
    @State var placeHolder : String = "리뷰 작성하기"
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text("별점")
                    .font(.system(size: 18))
                    .foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                    .padding(20)
                
                
                HStack(spacing: 0) {
                    // 별점 이미지
                    ForEach(1..<maxRating + 1, id:\.self) {number in
                        image(for: number)
                            .font(.system(size: 20))
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                ratingValue = number
                            }
                    }
                  
                } // hstack

                // 별점 숫자
                Text("\(ratingValue) / 5")
                    .font(.system(size: 14))
                    .padding(20)
                
            }  // vstack
            .frame(maxWidth: .infinity)
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .padding(30)
        
            
            // 리뷰 쓰기
            VStack {
                Text("리뷰 작성")
                    .font(.system(size: 18))
                    .foregroundColor(Color("mainPointColor"))
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                
                Divider()
                
                ZStack(alignment: .topLeading) {
                    // 텍스트 작성
                    TextEditor(text: $inputReview)
                        .font(.system(size: 18))
                        .lineSpacing(5)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .padding(.top, 10).ignoresSafeArea()
                        .scrollContentBackground(.hidden)
                        .background(Color("bgColor"))
                    if inputReview.isEmpty {
                        Text(placeHolder)
                            .font(.system(size: 18))
                            .foregroundColor(Color("grayTextColor"))
                            .lineSpacing(5)
                            .padding(.top, 18).ignoresSafeArea()
                            .padding(.horizontal, 24)
                    }
                
                    
                } // zstack
                .frame(maxWidth: .infinity, minHeight: 300)
                
                
                Text("\(inputReview.count) / 100")
                    .padding(.bottom, 20)
                

                
                
            }
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .padding(.horizontal, 30)
            .padding(.top, 0).ignoresSafeArea()
            

                
            
            
        }
        .navigationTitle("별점 및 리뷰 남기기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            self.isPresented = false
        }, label: {
            Text("취소")
        }), trailing: Button(action: {
                self.isPresented = false
        }, label: {
            Text("확인")
        }))
        .background(Color("bgMainColor"))
    } // body
    
    func image(for number: Int) -> Image {
        if number > ratingValue {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
//    func saveReview(for ratingValue: Int, for inputReview: String) {
//
//    }

}



// CafeInfoView에서 별점 나타내는 뷰
struct StarsView: View {
    private static let MAX_RATING: Float = 5 // Defines upper limit of the rating
    private static let COLOR = Color.yellow // The color of the stars

    let rating: Float
    private let fullCount: Int
    private let emptyCount: Int
    private let halfFullCount: Int

    init(rating: Float) {
        self.rating = rating
        fullCount = Int(rating)
        emptyCount = Int(StarsView.MAX_RATING - rating)
        halfFullCount = (Float(fullCount + emptyCount) < StarsView.MAX_RATING) ? 1 : 0
    }

    var body: some View {
        HStack {
            ForEach(0..<fullCount) { _ in
                self.fullStar
            }
            ForEach(0..<halfFullCount) { _ in
               self.halfFullStar
            }
            ForEach(0..<emptyCount) { _ in
               self.emptyStar
            }
        }
    }

    var fullStar: some View {
        Image(systemName: "star.fill").foregroundColor(StarsView.COLOR)
    }

    var halfFullStar: some View {
        Image(systemName: "star.lefthalf.fill").foregroundColor(StarsView.COLOR)
    }

    var emptyStar: some View {
        Image(systemName: "star").foregroundColor(StarsView.COLOR)
    }
}

