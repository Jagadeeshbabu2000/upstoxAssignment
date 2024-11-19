import SwiftUI

struct Stockscomponents: View {
    let bankName: String
    let Lasttradedprice: Int
    let quantityofholding: Int
    let PL: Int

    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(bankName)
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                HStack(spacing: 3) {
                    Text("LTP:")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.gray)
                    Text("₹ \(Lasttradedprice)")
                }
            }
            
            HStack {
                HStack(spacing: 3) {
                    Text("NET QTY:")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.gray)
                    Text("\(quantityofholding)")
                }
                Spacer()
                
                HStack(spacing: 3) {
                    Text("P&L:")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.gray)
                    
                    Text("₹ \(PL)")

                }
            }
           
        }
        .padding()
    }
}

#Preview {
    Stockscomponents(
           bankName: "SBI",
           Lasttradedprice: 550,
           quantityofholding: 150,
           PL: 49
       )
}
