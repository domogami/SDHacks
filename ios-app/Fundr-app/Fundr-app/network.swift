//
//  network.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

import Foundation

class Network: ObservableObject {
  @Published var founders: [Founder] = []
  
  func getFounders() {
      guard let url = URL(string: "http://73.241.165.82:8080/founder?count=3") else { fatalError("Missing URL") }

      let urlRequest = URLRequest(url: url)

      let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
          if let error = error {
              print("Request error: ", error)
              return
          }

          guard let response = response as? HTTPURLResponse else { return }

          if response.statusCode == 200 {
              guard let data = data else { return }
              DispatchQueue.main.async {
                  do {
                      let decodedFounders = try JSONDecoder().decode([Founder].self, from: data)
                      self.founders = decodedFounders
                  } catch let error {
                      print("Error decoding: ", error)
                  }
              }
          }
      }

      dataTask.resume()
  }
  
//  func getImage(imgStr: String) {
//      guard let url = URL(string: "http://73.241.165.82:8080/founder/image?file_name=\(imgStr)") else { fatalError("Missing URL") }
//
//      let urlRequest = URLRequest(url: url)
//
//      let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//          if let error = error {
//              print("Request error: ", error)
//              return
//          }
//
//          guard let response = response as? HTTPURLResponse else { return }
//
//          if response.statusCode == 200 {
//              guard let data = data else { return }
//              DispatchQueue.main.async {
//                  do {
//                      let decodedFounders = try JSONDecoder().decode([Founder].self, from: data)
//                      self.founders = decodedFounders
//                  } catch let error {
//                      print("Error decoding: ", error)
//                  }
//              }
//          }
//      }
//
//      dataTask.resume()
//  }

  
}

