import SwiftUI
struct Portfolio: View {
    @StateObject var listData = ViewModelTrading()
    @State private var selectedButton: String = "holdings"
    @State private var isLoading: Bool = true
    @State private var selectedHolding: Holding?

    var body: some View {
        VStack {
            HStack {
                Button("POSITIONS") {
                    selectedButton = "positions"
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedButton == "positions" ? .black : .gray)

                Button("HOLDINGS") {
                    selectedButton = "holdings"
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(selectedButton == "holdings" ? .black : .gray)
            }
            .padding()
            Divider()
            Spacer()

            if isLoading {
                ProgressView("Loading data...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                if selectedButton == "holdings" {
                    List(listData.listData, id: \.id) { data in
                        Button(action: {
                            selectedHolding = Holding(
                                symbol: data.symbol,
                                ltp: data.ltp,
                                quantity: data.quantity,
                                close: data.close,
                                averagePrice: data.avgPrice
                            )
                        }) {
                            Stockscomponents(
                                bankName: data.symbol,
                                Lasttradedprice: Int(data.ltp),
                                quantityofholding: data.quantity,
                                PL: Int(data.close)
                            )
                        }
                    }
                    .listStyle(.inset)
                } else {
                    Text("No Data")
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            if let selectedHolding = selectedHolding {
                Profitandloss(holdings: [selectedHolding], isExpand: false)
            } else {
                Text("Select a holding to view Profit & Loss")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            Task {
                await listData.fetchData()
                isLoading = false
                if let firstHolding = listData.listData.first {
                    selectedHolding = Holding(
                        symbol: firstHolding.symbol,
                        ltp: firstHolding.ltp,
                        quantity: firstHolding.quantity,
                        close: firstHolding.close,
                        averagePrice: firstHolding.avgPrice
                    )
                }
            }
        }
    }
}

#Preview {
    Portfolio()
}
