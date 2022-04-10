//
//  ContentView.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var network: Network
//  @State var cards: [company_card] = [
//    company_card(name: "Jeff", company: "Azon"),
//    company_card(name: "2", company: "Azon"),
//    company_card(name: "3", company: "Azon"),
//    company_card(name: "4", company: "Azon"),
//    company_card(name: "5", company: "Azon")
//  ]
  
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
              .foregroundColor(Color("Fundr-Green"))
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
      
      GeometryReader { geometry in
        VStack {
          Text("")
        }
        .frame(width:geometry.size.width * 0.65, height: geometry.size.height * 0.60)
        .background(Color("Fundr-White"))
        .cornerRadius(25)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY + 40)
      }
      GeometryReader { geometry in
        VStack {
          Text("")
        }
        .frame(width:geometry.size.width * 0.75, height: geometry.size.height * 0.60)
        .background(Color("Fundr-White"))
        .cornerRadius(25)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY + 20)
      }
      GeometryReader { geometry in
        VStack {
          Text("")
        }
        .frame(width:geometry.size.width * 0.85, height: geometry.size.height * 0.70)
        .background(Color("Fundr-White"))
        .cornerRadius(25)
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY - 40)
      }
      
      
//      ScrollView {
//        VStack(alignment: .leading) {
//          ForEach(network.founders) { founder in
//            HStack(alignment:.top) {
//              VStack(alignment: .leading) {
//                Text(founder.name)
//                    .bold()
//                AsyncImage(url: URL(string: "http://73.241.165.82:8080/founder/image?file_name=\(founder.image)")) { image in
//                    image.resizable()
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 400, height: 150)
//                Text(founder.name.lowercased())
//
//                Text(founder.bio)
//              }
//            }
//            .frame(width: 300, alignment: .leading)
//            .padding()
//            .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
//            .cornerRadius(20)
//          }
//        }
//      }
//      .padding(.vertical)
//
//      }
      
      ZStack{
        ForEach(network.founders) { founder in
          ZStack{
            company_card(name: founder.name, company: founder.company_name, imag: founder.image, bio: founder.bio)
          }
        }
      }
      //          for founder in network.founders {
      //            print("BLAHHHHH IM TIRED")
      //            cards.append(company_card(name: founder.name, company: founder.company_name))
      //          }
    }.onAppear {
      network.getFounders()

    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(Network())
    }
}
