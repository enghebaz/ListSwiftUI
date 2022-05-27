//
//  ListViewModel.swift
//  ListSwiftUI
//
//  Created by Heba on 26/05/2022.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    @Published var listItems: [ListItem] = []
    @Published var isRequestFailed = false
    private var cancellable: AnyCancellable?
    
    func getMainList() {
        cancellable = APIService.shared.getMainList()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.isRequestFailed = true
                    print(error)
                case .finished:
                    print("finished")
                }
            } receiveValue: { response in
                self.listItems.append(contentsOf: response.results)
            }

    }
}
