//
//  ContentView.swift
//  Weather-app
//
//  Created by MacBook Pro on 27/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
     
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityName: "Lahore,PK")
                MainWeatherStatusView(imageName:isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
                HStack(spacing: 30){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 75)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "snow",
                                   temperature: 25)
                }
                .padding()
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: isNight ? "Change Night Time" : "Change Day Time",
                                  textColor: isNight ? .black : .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium, design: .default))
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.red, .black, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 20,weight: .medium))
        }
    }
}

struct BackgroundView: View {
//    var topColor: Color
//    var bottomColor: Color
//    
    var isNight: Bool
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient )
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack{
            VStack (spacing: 8){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180,height: 180)
                Text("\(temperature)°")
                    .font(.system(size: 70,weight: .medium))
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(5)
    }
}
