//
//  ContentView.swift
//  Dashboard Swift UI
//
//

import SwiftUI

struct ContentView: View {
    @State var isLoading: Bool = true
    var tabItems = TabItem.allCases
    @State var selected: TabItem = .link
    
    @State var viewModel = ChartDataViewModel()
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selected) {
                LinksTabView(viewModel: $viewModel)
                    .tag(tabItems[0])
                    .onAppear {
                        Task {
                            isLoading = true
                            print("Calling api...")
                            await viewModel.fetchData()
                            isLoading = false
                        }
                    }
                    .overlay(
                        Group {
                            if isLoading {
                                ProgressView("Loading...")
                            } else {
                                LinksTabView(viewModel: $viewModel)
                            }
                        }
                    )
                Text("Courses")
                    .tag(tabItems[1])
                Text("Add")
                    .tag(tabItems[2])
                Text("Campaign")
                    .tag(tabItems[3])
                Text("Profile")
                    .tag(tabItems[4])
            }
            Spacer(minLength: 0)
            CustomTabbarView(tabItems: tabItems, selected: $selected)
        }
        .ignoresSafeArea(.all,edges: .bottom)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
