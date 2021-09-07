//
//  ProfileImgView.swift
//  iOS_Combine_Alamofire_SwiftUI_Practice
//
//  Created by Minhyun Cho on 2021/09/06.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileView: View {
    
    var imageUrl: URL
    
    var body: some View{
        URLImage(imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) // 동그랗게 모양 생성
        .overlay(Circle().stroke(Color.init(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),lineWidth: 2)) // 노란색 태두리 생성
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/men/42.jpg")!
        
        ProfileView(imageUrl: url)
    }
}
