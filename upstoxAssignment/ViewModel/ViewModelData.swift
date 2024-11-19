//
//  ViewModelData.swift
//  upstoxAssignment
//
//  Created by K V Jagadeesh babu on 18/11/24.
//

import SwiftUI

final class ViewModelTrading: ObservableObject {
    @Published var isLoading = false
    @Published var listData: [UserHolding] = []

    func fetchData() async {
        DispatchQueue.main.async { self.isLoading = true }
        do {
            let fetchedData = try await WebServices.featchapi()
            DispatchQueue.main.async {
                self.listData = fetchedData
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.listData = []
                self.isLoading = false
            }
            print("Error fetching data: \(error.localizedDescription)")
        }
    }
}

