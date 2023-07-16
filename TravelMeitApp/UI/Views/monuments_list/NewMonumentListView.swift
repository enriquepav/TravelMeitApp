//
//  NewMonumentListView.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 16/07/23.
//

import SwiftUI

struct NewMonumentListView: View {
    
    @ObservedObject var viewModel: NewMonumentListViewModel
        
    var body: some View {
        NavigationView {
            if case let .loaded(loadedState) = viewModel.state {
                loadedView(state: loadedState)
            } else {
                loadingView()
            }
        }.onAppear {
            viewModel.send(.viewAppeared)
        }
    }
}

private extension NewMonumentListView {
    
    func loadingView() -> some View {
        ProgressView()
    }
    
    func loadedView(state: NewMonumentListViewModel.LoadedState) -> some View {
        List {
            ForEach(state.monuments, id: \.monument) { user in
                Text(user.monument).onTapGesture {
                    viewModel.send(.monumentTapped(user))
                }
            }
        }
    }
}
