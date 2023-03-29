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
        List{
            ForEach(0...5, id: \.self){ item in
                MyListCardView()
                    
            }.listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
              
        }
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
