//
//  HeaderView.swift
//  GymReps
//
//  Created by AbdulKarim Jundi on 2025-01-13.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let bgColor: Color
    var body: some View {
       
        //header
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }.padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)

    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, bgColor:.blue)
}
