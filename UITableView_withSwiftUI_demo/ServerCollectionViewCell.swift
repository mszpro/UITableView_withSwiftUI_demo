//
//  ServerCollectionViewCell.swift
//  UITableView_withSwiftUI_demo
//
//  Created by Sora on 2022/09/28.
//

import SwiftUI

struct ServerCollectionViewCell: View {
    
    @ObservedObject var item: ServerConfiguration
    
    var body: some View {
        HStack {
            // Star indicator and button
            Button {
                item.isServerStarred.toggle()
            } label: {
                Image(systemName: item.isServerStarred ? "star.fill" : "star")
            }
            // Server nickname
            Text(item.serverNickname)
        }
    }
    
}
