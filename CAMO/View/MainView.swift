//
//  MainView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/08.
//

import SwiftUI
import Foundation

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
        .onAppear() {
            checkCameraPermission()
            checkAlbumPermission()
        }
        
    }
}

//
//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}

