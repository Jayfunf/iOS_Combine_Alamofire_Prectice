//
//  RandomUserViewModel.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/07.
//

// API호출, 파싱

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject { // 이벤트 받을 수 있음
 
    //MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print("")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers(){ // 
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResopnse.self)
            .compactMap{ $0.value } // unrraping
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료")
            }, receiveValue: { receivedValue in
                print("받은 값: \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
    
    
}
