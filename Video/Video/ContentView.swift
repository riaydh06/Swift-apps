//
//  ContentView.swift
//  Video
//
//  Created by Sayed Riaydh on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    var vidwos: [Video] = VideoList.topTen
    var body: some View {
        NavigationView {
//            NavigationLink(destination: LoginForm(), label: {
//                Text("Form")
//            })
            List(vidwos, id: \.id) { video in
                HStack(spacing: 10){
                    NavigationLink(destination: VideoDetailView(video: video ), label: {
                        Image(video.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                            .cornerRadius(4)
                         
                        VStack(alignment: .leading, spacing: 5){
                            Text(video.title)
                             .fontWeight(.semibold)
                             .lineLimit(2)
                             .minimumScaleFactor(0.5)
                         
                            Text(video.uploadDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    })
                    
                }
            }
            .navigationTitle("Sean's Top 10")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
