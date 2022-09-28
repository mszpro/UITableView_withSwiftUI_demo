//
//  ServerConfiguration.swift
//  UITableView_withSwiftUI_demo
//
//  Created by Sora on 2022/09/28.
//

import Foundation

class ServerConfiguration: ObservableObject {
    var serverNickname: String
    var serverRegion: String
    var serverHardwareType: String
    var numberOfCPUCores: Int
    var gbOfMemory: Int
    var networkMaxSpeedGB: Int?
    @Published var isServerStarred: Bool
    
    init(serverNickname: String, serverRegion: String, serverHardwareType: String, numberOfCPUCores: Int, gbOfMemory: Int, networkMaxSpeedGB: Int? = nil, isServerStarred: Bool) {
        self.serverNickname = serverNickname
        self.serverRegion = serverRegion
        self.serverHardwareType = serverHardwareType
        self.numberOfCPUCores = numberOfCPUCores
        self.gbOfMemory = gbOfMemory
        self.networkMaxSpeedGB = networkMaxSpeedGB
        self.isServerStarred = isServerStarred
    }
}

enum DemoData {
    static let demoServers: [ServerConfiguration] = [
        .init(serverNickname: "Neko",
              serverRegion: "ap-northeast-1",
              serverHardwareType: "m6g.medium",
              numberOfCPUCores: 1,
              gbOfMemory: 4,
              networkMaxSpeedGB: 10,
              isServerStarred: true
             ),
        .init(serverNickname: "Taro",
              serverRegion: "ap-northeast-3",
              serverHardwareType: "t2.micro",
              numberOfCPUCores: 1,
              gbOfMemory: 1,
              isServerStarred: false
             )
    ]
}
