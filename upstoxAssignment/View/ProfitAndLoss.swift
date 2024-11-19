import SwiftUI

struct Profitandloss: View {
    var holdings: [Holding] 
    @State var isExpand = false

    var currentValue: Double {
        holdings.reduce(0) { $0 + ($1.ltp * Double($1.quantity)) }
    }
    var totalInvestment: Double {
        holdings.reduce(0) { $0 + ($1.averagePrice * Double($1.quantity)) }
    }
    var totalPNL: Double {
        currentValue - totalInvestment
    }
    var todaysPNL: Double {
        holdings.reduce(0) { $0 + ((Double($1.close) - $1.ltp) * Double($1.quantity)) }
    }

    var body: some View {
        VStack {
            HStack {
                Text("Profit & Loss*")
                Button(action: {
                    withAnimation {
                        isExpand.toggle()
                    }
                }, label: {
                    Image(systemName: isExpand ? "chevron.down" : "chevron.up")
                })
                Spacer()
                Text(String(format: "₹ %.2f", totalPNL))
                    .foregroundStyle(totalPNL >= 0 ? .green : .red)
            }
            Divider()
            if isExpand {
                VStack(spacing: 15) {
                    HStack {
                        Text("Current Value*")
                        Spacer()
                        Text(String(format: "₹ %.2f", currentValue))
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Total Investment*")
                        Spacer()
                        Text(String(format: "₹ %.2f", totalInvestment))
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Today's Profit & Loss*")
                        Spacer()
                        Text(String(format: "₹ %.2f", todaysPNL))
                        .foregroundStyle(todaysPNL >= 0 ? .green : .red)
                    }
                }
            }
        }
        .padding()
        .background(Color("lightWhitecolor", bundle: nil))
        .cornerRadius(10)
    }
}
#Preview {
    Profitandloss(holdings: [
        Holding(symbol: "AAPL", ltp: 150.0, quantity: Int(140.0), close: 10, averagePrice: 148.0),
        Holding(symbol: "GOOGL", ltp: 2800.0, quantity: Int(2750.0), close: 5, averagePrice: 2780.0)
    ])
}
