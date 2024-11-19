//
//  NetworkManager.swift
//  upstoxAssignment
//
//  Created by K V Jagadeesh babu on 18/11/24.
//

import Foundation

final class WebServices {
    static func featchapi() async throws -> [UserHolding] {
        let urlString = "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/"
        guard let url = URL(string: urlString) else {
            throw ShowErrormessage.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ShowErrormessage.invalidStatusCode
        }
        do {
            let decodedResponse = try JSONDecoder().decode(StocksModel.self, from: data)
            return decodedResponse.data.userHolding
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            throw ShowErrormessage.invalidData
        }
    }
}
