//
//  ContentView.swift
//  Sidebar-2
//
//  Created by Sayed Riaydh on 6/12/23.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
    let image: String
    let handler: ()-> Void = {
        print("Hello")
    }
}

struct MenuContent: View{
    let items: [MenuItem] = [
        MenuItem(text: "Home", image: "house"),
        MenuItem(text: "Settings", image: "person.circle"),
        MenuItem(text: "Profile", image: "bell"),
        MenuItem(text: "Activity", image: "airplane"),
        MenuItem(text: "Flights", image: "gear"),
        MenuItem(text: "Share", image: "square.and.arrow.up"),
    ]
    
    var body: some View{
        ZStack{
            Color(UIColor(red: 43/255.0, green: 40/255.0, blue: 74/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    NavigationLink(destination: SomeView(title: item.text), label: {
                            OptionView(option: item)
                        })
                    Divider()
                }
                
                Spacer()
            }
            .padding(.top, 25)
        }
    }
}

struct SomeView: View {
    let title: String
    var body: some View {
        Text(title)
    }
}

struct SideMenu: View {
    let width: CGFloat
    let menuOpen: Bool
    let toggleMenu: ()->Void
    
    var body: some View{
        ZStack{
            // Dimmed dbackground view
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpen ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            
            // MenuContent
            
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpen ? 0 : -width)
                    .animation(.default)
                
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    @State var menuOpen = false
    var body: some View {
        NavigationView{
            ZStack{
                if !menuOpen{
                    Button(action: {
                        self.menuOpen.toggle()
                    }, label: {
                        Text("Open Menu")
                            .bold()
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50, alignment: .center)
                            .background(Color(.systemBlue))
                        
                    })
                }
                
                SideMenu(width: UIScreen.main.bounds.width/2, menuOpen: menuOpen, toggleMenu: toogleMenu)
            }
            
        }
    }
    
    func toogleMenu() {
        menuOpen.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OptionView: View {
    let option: MenuItem
    var body: some View {
        HStack {
            Image(systemName: option.image)
                .resizable()
                .aspectRatio(contentMode: .fit
                )
                .foregroundColor(.white)
                .frame(width: 32, height: 32, alignment: .center)
            
            Text(option.text)
                .bold()
                .font(.system(size: 22))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
    }
}
