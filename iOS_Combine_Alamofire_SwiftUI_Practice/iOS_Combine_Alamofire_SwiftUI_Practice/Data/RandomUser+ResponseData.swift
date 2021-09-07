//
//  RandomUser+ResponseData.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/06.
//

// JSON을 구조체로 만드는 코드

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible { // JSON 파싱
    var id = UUID()
    var name: Name
    var photo: Photo
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl: URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
    
}

struct Name: Codable, CustomStringConvertible{ // JSON 파싱
    var title: String
    var first: String
    var last: String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "학생", first: "민현", last: "조")
    }
}

struct Photo: Codable {
    var large: String
    var medium: String
    var thumbnail: String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/men/42.jpg",
                     medium: "https://randomuser.me/api/portraits/men/42.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/men/42.jpg")
    }
}

struct Info: Codable {
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResopnse: Codable, CustomStringConvertible { // JSON 파싱
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    var description: String {
        return "result.count: \(results.count) / Info: \(info.seed)"
    }
}
