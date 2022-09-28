//
//  ViewController.swift
//  UITableView_withSwiftUI_demo
//
//  Created by Sora on 2022/09/28.
//

import UIKit
import SwiftUI

class ViewController: UICollectionViewController {
    
    let servers = DemoData.demoServers
    
    // Configuration for using SwiftUI for cell
    private var swiftUICellViewRegister: UICollectionView.CellRegistration<UICollectionViewListCell, ServerConfiguration> = {
        .init { cell, indexPath, item in
            let hostingConfiguration = UIHostingConfiguration {
                // Provide the SwiftUI view components here
                ServerCollectionViewCell(item: item)
            }
            // Set the above view to the cell
            cell.contentConfiguration = hostingConfiguration
        }
    }()
    
    // Configuration for using SwiftUI for header view
    private var swiftUIHeaderViewRegister: UICollectionView.SupplementaryRegistration<UICollectionViewCell>?
    
    // Configuration for using SwiftUI for footer view
    private var swiftUIFooterViewRegister: UICollectionView.SupplementaryRegistration<UICollectionViewCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the collection view to list layout
        var listLayoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        listLayoutConfig.headerMode = .supplementary
        listLayoutConfig.footerMode = .supplementary
        let listLayout = UICollectionViewCompositionalLayout.list(using: listLayoutConfig)
        self.collectionView.collectionViewLayout = listLayout
        // Set up the header configuration
        // we set it up here so we can use the `self`
        self.swiftUIHeaderViewRegister = .init(elementKind: UICollectionView.elementKindSectionHeader) { [unowned self]
           (header, elementKind, indexPath) in
           // Define header content using `UIHostingConfiguration`
           header.contentConfiguration = UIHostingConfiguration {
               HStack {
                   Button("Mark all as starred") {
                       self.markAllAsStarred()
                   }
                   .buttonStyle(.borderedProminent)
                   Button("Default") {
                       self.markAllAsNotStarred()
                   }
                   .buttonStyle(.borderedProminent)
               }
           }
       }
        // Set up the footer configuration
        self.swiftUIFooterViewRegister = .init(elementKind: UICollectionView.elementKindSectionFooter) {
            (header, elementKind, indexPath) in
            // Define header content using `UIHostingConfiguration`
            header.contentConfiguration = UIHostingConfiguration {
                Text("Thanks for reading this article!")
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return servers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let serverInfo = servers[indexPath.row]
        let cell = collectionView.dequeueConfiguredReusableCell(using: swiftUICellViewRegister, for: indexPath, item: serverInfo)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let swiftUIHeaderViewRegister,
              let swiftUIFooterViewRegister else {
            return .init()
        }
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueConfiguredReusableSupplementary(
                using: swiftUIHeaderViewRegister,
                for: indexPath
            )
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueConfiguredReusableSupplementary(
                using: swiftUIFooterViewRegister,
                for: indexPath
            )
            return footer
        default:
            return .init()
        }
    }
    
    private func markAllAsStarred() {
        for item in self.servers {
            item.isServerStarred = true
        }
    }
    
    private func markAllAsNotStarred() {
        for item in self.servers {
            item.isServerStarred = false
        }
    }

}

