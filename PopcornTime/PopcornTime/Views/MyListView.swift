//
//  MyListView.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/03/23.
//

import SwiftUI

struct MyListView: View {
    @StateObject var movies = MoviesSingleton.sharedInstance
    var body: some View {
        List{
            ForEach(movies.movies, id: \.id){ movie in
                MyListCardView(media: movie)
                    .swipeActions(allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            movies.remove(movie: movie)
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                    }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }.listStyle(.plain)
    }
}


//struct MyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListView()
//    }
//}
