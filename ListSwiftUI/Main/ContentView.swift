//
//  ContentView.swift
//  ListSwiftUI
//
//  Created by Heba on 26/05/2022.
//
import Combine
import SwiftUI

struct ContentView: View {
    @ObservedObject private var listViewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                if listViewModel.listItems.count == 0 {
                    LoaderView(isFailed: listViewModel.isRequestFailed)
                        .onAppear(perform: fetchData)
                        .onTapGesture(perform: onTapLoadView)
                }
                else {
                    ForEach(listViewModel.listItems, id: \.uid) { item in
                        
                        NavigationLink {
                            DetailsView.init(item: item)
                        }
                        label: {
                            ListItemRow(item: item)
                        }
                    }
                }
                
            }
            .navigationTitle("List Items")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        listViewModel.getMainList()
    }
    
    private func onTapLoadView() {
        // enable tap to reload
        if listViewModel.isRequestFailed {
            listViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
