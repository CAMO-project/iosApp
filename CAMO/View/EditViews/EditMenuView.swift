//
//  EditMenuView.swift
//  CAMO
//
//  Created by 장세희 on 2022/12/11.
//

import SwiftUI

struct EditMenuView: View {
    
    @ObservedObject var cafeController = CafeController()
    @ObservedObject var menuController = MenuController()
    
    @State private var inputMenu: String = ""
    @State private var inputPrice: Int = 0
    
    @Binding var isPresented: Bool
    
    @State var popAddMenuAlert: Bool = false
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        cafeController.getCafe()
        menuController.getMenuList(cafeId: cafe.cafeId)
    }
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        
        VStack {
            
            List(menuController.menuList) { menuListDTO in
                MenuListEditRow(menuListDTO)
            }
            .listStyle(.plain)
            .padding(.bottom, 1)
            .padding(.horizontal, 30)
            .background(Color("bgMainColor"))
            
        } // vstack
        .navigationTitle("메뉴 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: Button(action: {
            self.popAddMenuAlert.toggle()
        }, label: {
            Text("추가")
        }), trailing: Button(action: {
            self.isPresented = false
        }, label: {
            Text("완료")
        }))
        .background(Color("bgMainColor"))
        .refreshable {
            self.cafeController.getCafe()
            self.menuController.getMenuList(cafeId: cafe.cafeId)
        }
        .alert("메뉴 추가", isPresented: $popAddMenuAlert, actions: {
            TextField("메뉴 이름", text: $inputMenu)
                .font(.system(size: 16))

            TextField("메뉴 가격", value: $inputPrice, formatter: formatter)
                .keyboardType(.decimalPad)
                .font(.system(size: 16))
            
            
            Button("추가", action: {
                menuController.menuRegister(menuRegi: Menu(menuId: 0, menuName: inputMenu, menuPrice: inputPrice, cafeId: cafeController.myCafe.cafeId))
                popAddMenuAlert.toggle()
            })
            Button("취소", role: .cancel, action: {})
        }, message: {
            Text("추가할 메뉴의 이름과 가격을 입력하세요.")
        })
    } // body
}

struct MenuListEditRow: View {
    
    @ObservedObject var menuController = MenuController()
    
    @State var popDelMenuAlert: Bool = false
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
        .onTapGesture {
            self.popDelMenuAlert.toggle()
        
        }
        .alert("메뉴를 삭제하시겠습니까?", isPresented: $popDelMenuAlert, actions: {
            
            Button("삭제", action: {
                menuController.menuDelete(menuDel: menuListDTO)
                popDelMenuAlert.toggle()
            })
            Button("취소", role: .cancel, action: {})
        }, message: {
            Text("\(menuListDTO.menuName) - \(menuListDTO.menuPrice)")
        })
        
    }
    
}

