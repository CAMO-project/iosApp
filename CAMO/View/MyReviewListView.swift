//
//  MyReviewListView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/11.
//

import SwiftUI

struct MyReviewListView: View {
    
    @ObservedObject var reviewController = ReviewController()
    
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        reviewController.getMyReviewList()
    }
    
    var body: some View {
        VStack {
            
            List(reviewController.myReviewList) { myReviewListDTO in
                MyReviewListRow(myReviewListDTO)
            }
            .listStyle(.plain)
            .padding(.bottom, 1)
            .padding(.horizontal, 30)
            .background(Color("bgMainColor"))
            
        }// vstack
        .navigationTitle("내가 쓴 리뷰 모아보기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            self.isPresented = false
        }, label: {
            Text("완료")
        }))
        .background(Color("bgMainColor"))
        .refreshable {
            reviewController.getMyReviewList()
        }
        
    }
}

struct MyReviewListRow: View {
    
    @ObservedObject var reviewController = ReviewController()
    
    @State var popDelReviewAlert: Bool = false
    var myReviewListDTO: MyReviewListDTO
    
    init(_ myReviewListDTO: MyReviewListDTO) {
        self.myReviewListDTO = myReviewListDTO
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                HStack {
                    Text(myReviewListDTO.reviewDate)
                        .font(.system(size: 12))
                        .padding(.trailing, 10)
                        .foregroundColor(Color("grayTextColor"))
                    Text(myReviewListDTO.cafeName)
                        .font(.system(size: 12))
                        .foregroundColor(Color("grayTextColor"))
                }
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .environment(\.symbolVariants, .none)
                        .font(.system(size: 14))
                        .foregroundColor(.yellow)
                    Text("\(myReviewListDTO.reviewRating)")
                        .font(.system(size: 12))
                }
            } // hstack
            .padding(.bottom, 10)
            Text(myReviewListDTO.reviewContent)
                .font(.system(size: 14))
            
        } // vstack
        .padding(.vertical, 20)
        .background(Color("bgMainColor"))
        .listRowBackground(Color("bgMainColor"))
        .onTapGesture {
            self.popDelReviewAlert.toggle()
        }
        .alert("리뷰를 삭제하시겠습니까?", isPresented: $popDelReviewAlert, actions: {
            
            Button("삭제", action: {
                reviewController.reviewDelete(reviewDel: myReviewListDTO)
                popDelReviewAlert.toggle()
            })
            Button("취소", role: .cancel, action: {})
        }, message: {
            Text("\(myReviewListDTO.reviewDate)에 작성된 카페 \(myReviewListDTO.cafeName) 리뷰")
        })
        
    }
}
