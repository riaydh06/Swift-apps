//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Sayed Riaydh on 6/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
//            Color(.blue).edgesIgnoringSafeArea(.all)
            BackgroundView(isNight: $isNight)
            VStack(spacing: 10){
                Text("Dhaka")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack{
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill"  )
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
//                Spacer()
                .padding(.bottom, 40)
                    
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 78)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 78)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "snow", temperature: 78)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title:"Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [ isNight ? .black : .blue,  isNight ? .gray : Color("lightBlue")], startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


