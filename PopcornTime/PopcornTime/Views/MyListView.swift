//
//  MyListView.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/03/23.
//

import SwiftUI

struct MyListView: View {
    
    var body: some View {
//        NavigationStack{
        if !myMovies.isEmpty {
            List{
                ForEach(myMovies, id: \.id){ movie in
                    MyListCardView(media: movie)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
            
    }
}

//struct MyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyListView()
//    }
//}
