//
//  MyListCardView.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/03/23.
//

import SwiftUI

struct MyListCardView: View {
    var media: Media
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack{
                if let poster = media.poster_path{
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"),
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 162, height: 245)
                        .cornerRadius(12.5)},
                    placeholder: {
                        EmptyView()
                    })
                }
                Spacer()
                VStack(alignment: .leading){
                    Text(media.title?.capitalized ?? "Unknown")
                        .font(.system(size: 16, weight: .bold))
                    Text(media.release_date ?? "Unknown")
                        .font(.system(size: 10, weight: .semibold))
                    Text(media.overview ?? "Unknown")
                        .font(.system(size: 10, weight: .regular))
                    Spacer()
                }.frame(width: 166, height: 230)
            }.frame(width: 345, height: 245)
        }
    }
}

//struct MyListCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListCardView()
//    }
//}
