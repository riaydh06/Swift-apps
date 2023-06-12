//
//  ContentView.swift
//  EmojiLover
//
//  Created by Sayed Riaydh on 6/5/23.
//

import SwiftUI

enum Emoji: String, CaseIterable{
    case 🥲,😃,😍,😘,😁,😝,😎
}

struct ContentView: View {
    @State var selecction: Emoji = .🥲
    var body: some View {
        NavigationView{
            VStack{
                Text(selecction.rawValue).font(.system(size: 149))
                Picker("Select Emoji", selection: $selecction){
                    ForEach(Emoji.allCases, id: \.self){ emoji in Text(emoji.rawValue)
                    }
                }.pickerStyle(.segmented)
            }.navigationTitle("Emoji Lover!").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
