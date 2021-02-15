//
//  GameItemsViewModel.swift
//  TapToSnap
//
//  Created by Archit Rai Saxena on 15/02/21.
//  Copyright © 2021 ArchitRaiSaxena. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class GameItemsViewModel: ObservableObject {
    private let service = GameItemNetworkService()
    @Published var isLoading: Bool = false
    @Published var canPush: Bool = false
    @Published var gameItems: [GameItem] = []
    
    var cancellable: AnyCancellable?
    
    func fetchGameItems() {
        isLoading = true
        canPush = false
        cancellable = service.fetchGameItems().sink(receiveCompletion: { _ in },
                                                    receiveValue: { items in
                                                        print("items:\(items.description)")
                                                        self.gameItems = items
                                                        self.isLoading = false
                                                        self.canPush = true
        })
    }
    
}
