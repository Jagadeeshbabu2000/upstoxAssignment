
import SwiftUI

final class WebServices {
    static func fetchAPI() async throws -> StocksModel {
        let urlString = "https://35dee773a9ec441e9f38d5fc249406ce.api.mockbin.io/"
        guard let url = URL(string: urlString) else {
            throw ShowErrormessage.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ShowErrormessage.invalidStatusCode
        }
//        if let jsonString = String(data: data, encoding: .utf8) {
//                   print("Raw JSON Response: \(jsonString)")
//               }
        do {
            let decodedData = try JSONDecoder().decode(StocksModel.self, from: data)
            return decodedData
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            throw ShowErrormessage.invalidData
        }
    }
}
