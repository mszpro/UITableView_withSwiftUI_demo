//
//  DemoTableView.swift
//  UITableView_withSwiftUI_demo
//
//  Created by Sora on 2022/09/28.
//

import Foundation
import UIKit
import SwiftUI

struct HelloWorldHeaderView: View {
    var body: some View {
        Text("Hello world!")
    }
}

class DemoTableViewController: UITableViewController {
    
    let servers = DemoData.demoServers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableHeaderView = UIHostingController(rootView: HelloWorldHeaderView()).view
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = servers[indexPath.row]
        // Apply SwiftUI view as the content of the cell
        cell.contentConfiguration = UIHostingConfiguration {
            ServerCollectionViewCell(item: item)
        }
        return cell
    }
    
}

