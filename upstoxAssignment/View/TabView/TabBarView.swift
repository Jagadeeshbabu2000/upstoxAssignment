import SwiftUI

struct TabBarView: View {
    @State var isSelected = 3
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "GrayColor")
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor.systemBlue
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
    var body: some View {
        TabView(selection: $isSelected) {
            WatchList()
                .tabItem {
                    Image("list")
                        .renderingMode(.template)
                    Text("WatchList")
                }
                .tag(1)
            Orders()
                .tabItem {
                    Image(systemName: "timer")
                        .renderingMode(.template)
                    Text("Orders")
                }
                .tag(2)
            Portfolio()
                .tabItem {
                    Image(systemName: "briefcase")
                        .renderingMode(.template)
                    Text("Portfolio")
                }
                .tag(3)
            Funds()
                .tabItem {
                    Image("rupee")
                        .renderingMode(.template)
                    Text("Funds")
                }
                .tag(4)
            Invest()
                .tabItem {
                    Image("save-money")
                        .renderingMode(.template)
                    Text("Invest")
                }
                .tag(5)
        }
        
    }
}

#Preview {
    TabBarView()
}
