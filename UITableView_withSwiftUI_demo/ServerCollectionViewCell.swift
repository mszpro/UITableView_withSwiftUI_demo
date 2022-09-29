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
            VStack(alignment: .leading, spacing: 5) {
                Text(item.serverNickname)
                    .font(.title2.bold())
                Text(item.serverHardwareType)
                HStack {
                    Label("\(item.numberOfCPUCores) cores", systemImage: "cpu")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(3)
                        .padding(.trailing, 5)
                        .background {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(.blue)
                        }
                    Label("\(item.gbOfMemory) GB", systemImage: "network")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(3)
                        .padding(.trailing, 5)
                        .background {
                            RoundedRectangle(cornerRadius: 10).foregroundColor(.blue)
                        }
                }
            }
        }
    }
    
}
