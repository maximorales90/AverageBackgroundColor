//
//  HomeView.swift
//  AverageBackgroundColor
//
//  Created by Maximiliano Morales on 19/04/2022.
//

import SwiftUI

struct HomeView: View {
    @State var currentIndex = 0
    @State private var backgroundColor: Color = .clear
    
    var body: some View {
       GeometryReader { geometry in
           VStack(alignment: .leading){
            Spacer()
            Image(images[self.currentIndex])
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width * 0.8, height: geometry.size.width * 0.8)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.horizontal,20)
                .onTapGesture {
                    if (self.currentIndex == images.count - 1) {
                        self.currentIndex = 0
                    } else {
                        self.currentIndex = min(self.currentIndex + 1,
                                                images.count - 1)
                    }

                    self.setAverageColor()
                }
            Spacer()
           }
           .padding()
        }
       .background(backgroundColor)
       .edgesIgnoringSafeArea(.all)
       .onAppear {
           self.setAverageColor()
       }
    }
    
    
    private func setAverageColor() {
        let uiColor = UIImage(named: images[self.currentIndex])?.averageColor ?? .clear
        backgroundColor = Color(uiColor)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

