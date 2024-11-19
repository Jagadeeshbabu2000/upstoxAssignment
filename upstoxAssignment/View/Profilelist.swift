import SwiftUI
struct Profilelist: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text("Profile")
                    .font(.headline)
                Spacer()
                HStack(spacing: 15) {
                    Image("up-down")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Image("Search")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .foregroundColor(.white)
            .background(Color("ThinColor", bundle: nil).edgesIgnoringSafeArea(.top))
        }
    }
}

#Preview {
    Profilelist()
}
