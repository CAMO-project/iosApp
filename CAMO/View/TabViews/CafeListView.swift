//
//  CafeListView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/02.
//

import SwiftUI

struct CafeListView: View {

    @ObservedObject var networking = CafeListSetUpClass()
    
    @State private var inputSearch: String = ""
    
    init() {
        networking.alamofireNetworking()
    }
    
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

            
            
            List(networking.cafeList) { cafeListDTO in
                
                CafeListRow(cafeListDTO)
                
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


struct CafeListRow: View {
    
//    var cafeId : String
//    var cafeName : String
//    var cafeAddress : String
//    var avgRating : Float
    
    var cafeListDTO : CafeListDTO
    @State private var cafeId : String = ""
    
    @State private var isActive: Bool = false
    
    init(_ cafeListDTO: CafeListDTO) {
        self.cafeListDTO = cafeListDTO
//        self.cafeId = Int(cafeListDTO.cafeId) ?? 0
    }
    
    var body: some View {
        ZStack {
            NavigationLink(destination: CafeInfoView(cafeId: $cafeId), isActive: $isActive) {
                EmptyView()
            } //navigationlink
            .opacity(0.0)
//            .hidden()
            .buttonStyle(PlainButtonStyle())
            
            VStack (alignment: .leading) {
                HStack {
                    Text("\(cafeListDTO.cafeName)").font(.system(size: 16))
                    Spacer()
                    HStack {
                        Image(systemName: "star.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 14))
                            .foregroundColor(.yellow)
                        Text("\(cafeListDTO.avgRating)")
                            .font(.system(size: 14))
                    } // hstack
                } // hstack
                .padding(.bottom, 10)
                Text("\(cafeListDTO.cafeAddress)").font(.system(size: 12))
                    .foregroundColor(Color("grayTextColor"))
            } // vstack
            .padding(.vertical, 20)
        }
        .background(Color("bgMainColor"))
        .listRowBackground(Color("bgMainColor"))
        .onAppear() {
            print(cafeListDTO.cafeName)
        }
    }
}
