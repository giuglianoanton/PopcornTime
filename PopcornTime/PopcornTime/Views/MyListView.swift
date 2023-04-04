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
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }.listStyle(.plain)
        Button(action: {
            print(MoviesSingleton.sharedInstance.movies)
        }, label: {
            Text("print")
        })
    }
}

//struct MyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListView()
//    }
//}
