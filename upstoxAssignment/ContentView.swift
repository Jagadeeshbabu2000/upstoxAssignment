import SwiftUI
struct ContentView: View {
    @State var isExpand = false
    var body: some View {
        VStack {
            Profilelist()
            TabBarView()
        }
    }
}

#Preview {
    ContentView()
}
