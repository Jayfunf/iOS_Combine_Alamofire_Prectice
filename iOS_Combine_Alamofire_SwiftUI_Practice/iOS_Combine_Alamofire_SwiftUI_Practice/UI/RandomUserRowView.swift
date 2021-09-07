//
//  RandomUserRowView.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/06.
//

import Foundation
import SwiftUI

struct RandomUserRowView: View {
    
    var randomUser : RandomUser
    
    init(_ randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack{
            ProfileView(imageUrl: randomUser.profileImgUrl)
            Text("\(randomUser.description)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .minimumScaleFactor(0.5)
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: 50, alignment: .leading).padding(.vertical).background(Color.yellow)
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView(RandomUser.getDummy())
    }
}
