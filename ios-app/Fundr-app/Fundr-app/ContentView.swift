//
//  ContentView.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import SwiftUI

struct ContentView: View {
  @State var viewState = CGSize.zero
  @EnvironmentObject var network: Network
  var body: some View {
    ZStack {
      VStack{
        HStack {
          Text("Discover")
          .font(Font.custom("Poppins-Bold", size: 35))
          .foregroundColor(Color("Fundr-Dark-Green"))
          
          Spacer()
          Image("avatar-29")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        }
        .padding(.leading, 25)
        .padding(.trailing, 25)
        .padding(.top, 10)
        Spacer()
      }.background(Color("Fundr-White"))
      
      VStack{
        Spacer()
        HStack{
          Button(action: {
            print("button pressed")
          }) {
            Image(systemName: "house")
              .font(.system(size: 25, weight: .regular))
              .foregroundColor(Color("Fundr-Dark-Green"))
              .padding(.leading, 30)
              .padding(.trailing, 30)
          }
          Button(action: {
            print("button pressed")
          }) {
            Image(systemName: "message")
              .font(.system(size: 25, weight: .regular))
              .foregroundColor(Color("Fundr-Dark-Green"))
              .padding(.leading, 30)
              .padding(.trailing, 30)
          }
          Button(action: {
            print("button pressed")
          }) {
            Image(systemName: "person.crop.circle")
              .font(.system(size: 25, weight: .regular))
              .foregroundColor(Color("Fundr-Dark-Green"))
              .padding(.leading, 30)
              .padding(.trailing, 30)
          }
        }.background(Color("Fundr-White"))
      }
      
      ScrollView {
        VStack(alignment: .leading) {
          ForEach(network.founders) { founder in
            HStack(alignment:.top) {
              VStack(alignment: .leading) {
                Text(founder.name)
                    .bold()
                AsyncImage(url: URL(string: "http://73.241.165.82:8080/founder/image?file_name=\(founder.image)")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 400, height: 150)
                Text(founder.name.lowercased())

                Text(founder.bio)
              }
            }
            .frame(width: 300, alignment: .leading)
            .padding()
            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
            .cornerRadius(20)
          }
        }

      }
      .padding(.vertical)
      .onAppear {
          network.getFounders()
        
      }
      
//      company_card()
//        .offset(x: self.viewState.width, y: self.viewState.height)
//        .rotationEffect(.degrees(1/20 * Double(viewState.width)))
//
//        .gesture(
//        DragGesture().onChanged { value in
//          self.viewState = value.translation
//        }
//        .onEnded { value in
//          self.viewState = .zero
//        }
//        ).animation(.spring(), value: 0.1)
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(Network())
    }
}
