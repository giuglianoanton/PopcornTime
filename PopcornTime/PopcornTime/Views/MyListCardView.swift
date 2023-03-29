//
//  MyListCardView.swift
//  PopcornTime
//
//  Created by Antonella Giugliano on 29/03/23.
//

import SwiftUI

struct MyListCardView: View {
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack{
                Rectangle()
                    .frame(width: 162, height: 245)
                    .cornerRadius(12.5)
                Spacer()
                VStack(alignment: .leading){
                    Text("title".capitalized)
                        .font(.system(size: 16, weight: .bold))
                    Text("year")
                        .font(.system(size: 10, weight: .semibold))
                    Spacer()
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.system(size: 10, weight: .regular))
                    
                }.frame(width: 166, height: 230)
            }.frame(width: 345, height: 245)
            
            Button(action: {
                print("unsaved")
            }, label: {
                Image(systemName: "heart.fill")
                    .font(.system(size: 20, weight: .bold))
                    .shadow(color:.black.opacity(0.18), radius: 3, x: 0, y:4)
            }).padding([.top])
        }
    }
}

struct MyListCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyListCardView()
    }
}