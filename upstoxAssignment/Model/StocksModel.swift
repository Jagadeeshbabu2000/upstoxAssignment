import Foundation

struct StocksModel: Codable {
    let data: HoldingsData
}
struct HoldingsData: Codable {
    let userHolding: [UserHolding]
}
struct UserHolding: Identifiable, Codable {
    let id = UUID() 
    let symbol: String
    let quantity: Int
    let ltp: Double
    let avgPrice: Double
    let close: Double
    
    private enum CodingKeys: String, CodingKey {
        case symbol, quantity, ltp, avgPrice, close
    }
}

struct Holding: Identifiable {
    let id = UUID()
    let symbol: String
    let ltp: Double 
    let quantity: Int
    let close: Double
    let averagePrice: Double
}
