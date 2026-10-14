import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("淺色模式") {
    ContentView()
        .preferredColorScheme(.light)
}
