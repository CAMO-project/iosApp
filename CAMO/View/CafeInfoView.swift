//
//  CafeInfoView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/10.
//

import SwiftUI

struct CafeInfoView: View {
    
    @ObservedObject var cafeController = CafeController()
    @ObservedObject var menuController = MenuController()
    @ObservedObject var reviewController = ReviewController()
    
    @State private var isActiveMenu: Bool = false
    @State private var isActiveWrite: Bool = false
    
    @State var reviewSettings: Bool = false

    init(_ cafeId: String) {
        cafeController.getCafeInfo(cafeId: cafeId)
        menuController.getMenuList(cafeId: cafeId)
        reviewController.getReivewList(cafeId: cafeId)
    }
    
    var body: some View {
        ScrollView {
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
                        Text("\(cafeController.cafeInfo.cafeAddress)")
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
                        Text("\(cafeController.cafeInfo.cafePhone)")
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
                            Text("스탬프 \(cafeController.cafeInfo.couponUserstamp) / \(cafeController.cafeInfo.cafeRewardstamp)")
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
                            Text(cafeController.cafeInfo.cafeReward)
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
                        Text(cafeController.cafeInfo.cafeIntroduce)
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
            
            NavigationLink(destination: menuListView(cafeController.cafeInfo.cafeId), isActive: $isActiveMenu) {
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
                    
//                    HStack {
//                        VStack {
//                            Image("testImage2")
//            //                    .renderingMode(.original)
//                                .resizable()
//                                .aspectRatio(1.0, contentMode: .fit)
//                                .clipShape(RoundedRectangle(cornerRadius: 20))
//                                .clipped() //프레임을 벗어나는 이미지 제거
//
//                            Text("아이스 아메리카노")
//                                .font(.system(size: 14))
//                                .lineLimit(1)
//                                .padding(.top, 10)
//                                .padding(.bottom, 1).ignoresSafeArea()
//                            Text("2500원")
//                                .font(.system(size: 12))
//                                .foregroundColor(Color("grayTextColor"))
//                        }
//                        .padding(.trailing, 5)
//                        VStack {
//                            Image("testImage3")
//            //                    .renderingMode(.original)
//                                .resizable()
//                                .aspectRatio(1.0, contentMode: .fit)
//                                .clipShape(RoundedRectangle(cornerRadius: 20))
//                                .clipped() //프레임을 벗어나는 이미지 제거
//
//                            Text("아이스 아메리카노")
//                                .font(.system(size: 14))
//                                .lineLimit(1)
//                                .padding(.top, 10)
//                                .padding(.bottom, 1).ignoresSafeArea()
//                            Text("2500원")
//                                .font(.system(size: 12))
//                                .foregroundColor(Color("grayTextColor"))
//                        }
//                        .padding(.leading, 5)
//                    } // hstack
//                    .padding(.horizontal, 20)
//                    .padding(.top, 0).ignoresSafeArea()
//                    .padding(.bottom, 20)
                    
                    VStack {
                        Text("메뉴 2개만 반환해쥬,,")
                            .foregroundColor(Color("textColor"))
                    }
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
                        WriteReView(cafeId: cafeController.cafeInfo.cafeId, isPresented: $reviewSettings)
    //                        .navigationBarHidden(false)
                            .navigationBarBackButtonHidden(false)
                    }
                    
                }
                
                if (reviewController.reviewList.count == 0) {
                    HStack {
                        Text("별점")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.trailing, 10)
                        Text("아직 별점이 없습니다.")
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.vertical, 30)
                    
                    
                    HStack {
                        Text("이용자 리뷰")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.trailing, 10)
                        
                        Text("아직 이용자 리뷰가 없습니다.")
                            .font(.system(size: 14))
                        Spacer()
                            
                    }
                    .padding(.bottom, 30)
                    
                } else {
                    HStack {
                        Text("별점")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.trailing, 10)
                        StarsView(rating: cafeController.cafeInfo.avgRating)
                            .padding(.trailing, 10)
                        Text("\(cafeController.cafeInfo.avgRating)")
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.vertical, 30)
                    
                    
                    HStack {
                        Text("이용자 리뷰")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.trailing, 10)
                        
                        Text("\(reviewController.reviewList.count)개")
                            .font(.system(size: 14))
                        Spacer()
                            
                    }
                    
                    VStack{
                        List(reviewController.reviewList) { reviewListDTO in
                            ReviewListRow(reviewListDTO)
                        }
                        .listStyle(.plain)
                        .padding(.top, 0).ignoresSafeArea()
                        .padding(.bottom, 1)
                        .background(Color("bgMainColor"))
                    }.frame(maxWidth: .infinity, minHeight: 500)
                }
             
            } // vstack
            .padding(30)
          
        } // scrollView
        .navigationTitle("\(cafeController.cafeInfo.cafeName)")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("bgMainColor"))
        .onAppear() {
            print("reviewList: \(reviewController.reviewList)")
        }
    }
}

//struct CafeInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        CafeInfoView()
//    }
//}


struct ReviewListRow: View {
    
    var reviewListDTO: ReviewListDTO
    
    init(_ reviewListDTO: ReviewListDTO) {
        self.reviewListDTO = reviewListDTO
    }
    
    // reviewDate userEmail         staricon reviewRating
    // reviewContent
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                HStack {
                    Text(reviewListDTO.reviewDate)
                        .font(.system(size: 12))
                        .padding(.trailing, 10)
                        .foregroundColor(Color("grayTextColor"))
                    Text(reviewListDTO.userEmail)
                        .font(.system(size: 12))
                        .foregroundColor(Color("grayTextColor"))
                }
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .environment(\.symbolVariants, .none)
                        .font(.system(size: 14))
                        .foregroundColor(.yellow)
                    Text("\(reviewListDTO.reviewRating)")
                        .font(.system(size: 12))
                }
            } // hstack
            .padding(.bottom, 10)
            Text(reviewListDTO.reviewContent)
                .font(.system(size: 14))
            
        } // vstack
        .padding(.vertical, 20)
        .background(Color("bgMainColor"))
        .listRowBackground(Color("bgMainColor"))
        
    
    }
}



// CafeInfoView -> 메뉴 더보기 뷰
struct menuListView: View {
    
    @ObservedObject var menuController = MenuController()
    
    init(_ cafeId: String) {
        menuController.getMenuList(cafeId: cafeId)
    }
    
    var body: some View {
        
        VStack {
            List(menuController.menuList) { menuListDTO in
                MenuListRow(menuListDTO)
            }
            .listStyle(.plain)
            .padding(.horizontal, 30)
            .padding(.bottom, 1)
            .background(Color("bgMainColor"))
            
        }
        .navigationTitle("전체 메뉴")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color("bgMainColor"))
        
        
    }
}


struct MenuListRow: View {
    
    var menuListDTO: MenuListDTO
    
    init(_ menuListDTO: MenuListDTO) {
        self.menuListDTO = menuListDTO
    }
    
    var body: some View {
        HStack {
            Text(menuListDTO.menuName)
                .font(.system(size: 16))
            Spacer()
            Text("\(menuListDTO.menuPrice) 원")
                .font(.system(size: 16))
                .foregroundColor(Color("grayTextColor"))
            
        }
        .padding(.vertical, 20)
        .background(Color("bgMainColor"))
        .listRowBackground(Color("bgMainColor"))
    }
    
}


//fileprivate struct SaveBtn: View {
//    @Binding var isPresented : Bool
//
//    var body: some View {
//        Button(action: {
//            self.isPresented = false
//        }, label: {
//            Text("확인")
//        })
//    }
//}


//
// CafeInfoView -> 리뷰 작성하기 뷰
struct WriteReView: View {
    
    @ObservedObject var reviewController = ReviewController()
    
    var cafeId: String
    
    @Binding var isPresented: Bool

    @State var ratingValue : Int = 5

    var maxRating = 5

    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    @State var inputReview : String = ""
    @State var placeHolder : String = "리뷰 작성하기"
    
    @State var overflowTextAlert : Bool = false
    
    init(cafeId: String, isPresented: Binding<Bool>) {
        self.cafeId = cafeId
        self._isPresented = isPresented
        
    }
    
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
                    .font(.system(size: 16))
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
                
                
                Text("\(inputReview.count) / 500")
                    .font(.system(size: 16))
                    .padding(.bottom, 20)
                    .foregroundColor(inputReview.count <= 500 ? Color("textColor") : Color("redPointColor"))
                    

                
                
            }
            .background(Color("bgColor"))
            .border(Color.black.opacity(0), width: 0)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
            .padding(.horizontal, 30)
            .padding(.top, 0).ignoresSafeArea()
            .alert(isPresented: $overflowTextAlert) {
                Alert(title: Text("글자수 제한"),
                      message: Text("리뷰는 500자 이내로 작성해주세요"),
                      dismissButton: .default(Text("확인")))
            }

                
            
            
        }
        .navigationTitle("별점 및 리뷰 남기기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            isPresented = false
        }, label: {
            Text("취소")
        }), trailing: Button(action: {
            if (inputReview.count > 500) {
                    overflowTextAlert = true
            } else {
                reviewController.writeReview(Review(reviewId: 0, userEmail: user.email, reviewRating: ratingValue, reviewContent: inputReview, reviewDate: "", cafeId: cafeId, userId: user.userId))
                isPresented = false
            }
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

