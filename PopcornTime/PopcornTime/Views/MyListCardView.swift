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
                        
                        
//                        .scaledToFill()
                    
                        
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
            
            Button(action: {
                print("unsaved")
                MoviesSingleton.sharedInstance.didTapHeart(movie: media)
            }, label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20, weight: .bold))
                    .shadow(color:.black.opacity(0.18), radius: 3, x: 0, y:4)
            }).padding([.top])
        }
    }
//    func unfavourite(media: Media){
//        if let i = myMovies.firstIndex(where: {$0.id == media.id }){
//            print(myMovies.count)
//            myMovies.remove(at: i)
//            print(myMovies.count)
//        }
//    }
}

//struct MyListCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListCardView()
//    }
//}
