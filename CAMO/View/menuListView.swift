//
//  menuListView.swift
//  CAMO
//
//  Created by 장세희 on 2022/11/11.
//

import SwiftUI

struct menuListView: View {
    
    @Binding var businessNum : String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("\(businessNum)")
    }
}

//struct menuListView_Previews: PreviewProvider {
//    static var previews: some View {
//        menuListView()
//    }
//}
