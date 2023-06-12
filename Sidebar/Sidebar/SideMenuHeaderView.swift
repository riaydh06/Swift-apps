//
//  SideMenuHeaderView.swift
//  Sidebar
//
//  Created by Sayed Riaydh on 6/11/23.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShoing: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                withAnimation(.spring()){
                    isShoing.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
                
            })
            
            VStack(alignment: .leading){
              Image("Venom")
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Eddie Brock")
                    .font(.system(size: 24, weight: .semibold))
                Text("@venom")
                    .font(.system(size: 14))
                    .padding(.bottom, 24)
                
                HStack(spacing: 12){
                    HStack(spacing: 4){
                        Text("1,245")
                            .bold()
                        Text("Following")
                    }
                    
                    HStack(spacing: 4){
                        Text("607")
                            .bold()
                        Text("Followers")
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }.padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShoing: .constant(true))
    }
}
