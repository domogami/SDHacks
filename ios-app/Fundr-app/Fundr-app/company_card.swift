//
//  company_card.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import SwiftUI

struct company_card: View {
  
    var body: some View {
      GeometryReader { geometry in
        VStack {
          Text("Hello, World!")
            .frame(width:geometry.size.width * 0.85, height: geometry.size.height * 0.70)
          .background(Color("Fundr-White"))
          .cornerRadius(25)
          .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 50, x: 0, y: 10)
        }
        .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY - 40)
      }
    }
}

struct company_card_Previews: PreviewProvider {
    static var previews: some View {
        company_card()
    }
}
