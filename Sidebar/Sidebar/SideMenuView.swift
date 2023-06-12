//
//  SideMenuView.swift
//  Sidebar
//
//  Created by Sayed Riaydh on 6/11/23.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                SideMenuHeaderView(isShoing:  $isShowing)
                    .frame(height: 240)
                    .foregroundColor(.white)
                
                ForEach(SideMenuViewModel.allCases, id: \.self){
                        option in
                    NavigationLink(destination: Text(option.title), label: {
                        SideMenuOptionView(viewModel: option)
                    })
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(true))
    }
}
