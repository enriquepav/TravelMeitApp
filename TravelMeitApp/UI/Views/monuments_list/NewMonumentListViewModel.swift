//
//  NewMonumentListViewModel.swift
//  TravelMeitApp
//
//  Created by MAC1DIGITAL20 on 16/07/23.
//

import Foundation

final class NewMonumentListViewModel: ObservableObject {

    enum Event {
        case viewAppeared
        case monumentTapped(MonumentData)
    }

    enum State: Equatable {
        case loading
        case loaded(LoadedState)
    }

    struct LoadedState: Equatable {
        let monuments: [MonumentData]
    }

    @Published private(set) var state: State

    private let apiService: APIService

    init(state: State = .loading, apiService: APIService) {
        self.state = state
        self.apiService = apiService
    }

    public func send(_ event: Event) {
        switch event {
        case .viewAppeared:
            loadUsers()
        case .monumentTapped(let monument):
            userTapped(monument)
        }
    }
}

private extension NewMonumentListViewModel {

    func loadUsers() {
        Task { @MainActor in
            let monuments = apiService.apiToGetMonumentsData()
            state = .loaded(LoadedState(monuments: monuments))
        }
    }

    func userTapped(_ monument: MonumentData) {
        //usersInteractor.callUser(user)
    }
}

