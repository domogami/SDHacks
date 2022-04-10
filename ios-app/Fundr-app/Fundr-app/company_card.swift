//
//  company_card.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import SwiftUI

struct company_card: View, Identifiable {
    @State var viewState = CGSize.zero
//    var img: Image
    var name: String
    var company: String
    var id = UUID()
    var imag: String
    var bio: String
  
    var body: some View {
      GeometryReader { geometry in
        VStack {
          VStack{
            ZStack {
              AsyncImage(url: URL(string: "http://73.241.165.82:8080/founder/image?file_name=\(imag)")) { image in
                  image
                  .resizable()
                  .scaledToFill()
                  .frame(width:geometry.size.width * 0.75, height: geometry.size.height * 0.45)
                  .cornerRadius(25)
                  .offset(y: 41)
              } placeholder: {
                  ProgressView()
              }
              
              VStack {
                Spacer()
                ZStack {
                  Rectangle()
                    .fill(Color(red: 0, green: 0, blue: 0, opacity: 0.4)).blur(radius: 20, opaque: false)
                    .frame(width: geometry.size.width * 0.75, height: 100, alignment: Alignment.bottom)
                  Spacer()
                  HStack{
                  VStack(alignment: .leading, spacing: 0){
                    Text(name)
                      .foregroundColor(Color("Fundr-White").opacity(0.9))
                      .font(Font.custom("Poppins-Bold", size: 30))
                    
                    Text(company)
                        .foregroundColor(Color("Fundr-White").opacity(0.7))
                      .font(Font.custom("Poppins-Regular", size: 25))
                  }.padding(.leading, 20)
                    Spacer()
                  }
                }
              }
              .cornerRadius(25)
            }.frame(width:geometry.size.width * 0.75, height: geometry.size.height * 0.55)
            
//            Text(bio)
//              .foregroundColor(Color("Fundr-Dark-Green").opacity(0.9))
//              .font(Font.custom("Poppins-Regular", size: 20))
            
            HStack (alignment: .bottom, spacing: -70) {
              Image("Cross")
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
              Image("Money")
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
              Image("Message")
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
            }.frame(width: geometry.size.width * 0.75, alignment: .bottom)
              .padding(.top, -20)
//              .padding(.bottom, 20)
            Spacer()
            
          }
          .frame(width:geometry.size.width * 0.85, height: geometry.size.height * 0.70)
          .background(Color("Fundr-White"))
          .cornerRadius(25)
//          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
        }
        .animation(Animation.spring())
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY - 40)
        .offset(x: self.viewState.width, y: self.viewState.height)
        .rotationEffect(.degrees(1/20 * Double(viewState.width)))
        .gesture(
        DragGesture().onChanged { value in
          self.viewState = value.translation
        }
        .onEnded { value in
          if (self.viewState.width < -70) {
            self.viewState.width = -800
          } else if (self.viewState.width > 70) {
            self.viewState.width = 800
          } else {
            self.viewState = .zero
          }
        }
        ).animation(.spring(), value: 0.1)
      }
    }
}

struct company_card_Previews: PreviewProvider {
    static var previews: some View {
      company_card(name: "Jeff Bezos", company: "Amazon", imag: "/images/jeff.jpg", bio: "Blah")
    }
}
