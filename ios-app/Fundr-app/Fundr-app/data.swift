//
//  data.swift
//  Fundr-app
//
//  Created by Dominick Lee on 4/9/22.
//

//pub struct Founder
//{
//    pub uuid: Uuid,
//    pub name: String,
//    pub company_name: String,
//    pub bio: String,
//    pub image: String,
//}
//
//pub struct NewFounder
//{
//    pub name: String,
//    pub company_name: String,
//    pub bio: String,
//    pub image: String,
//}


import Foundation
import SwiftUI

struct Founder: Identifiable, Decodable {
    var id: UUID
    var name: String
    var company_name: String
    var bio: String
    var image: String
}

struct NewFounder: Decodable {
    var name: String
    var company_name: String
    var bio: String
    var image: String
}
