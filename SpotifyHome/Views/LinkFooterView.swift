import SwiftUI

/// 用 Markdown 寫的可點擊連結
struct LinkFooterView: View {
    let markdown: LocalizedStringKey

    var body: some View {
        Text(markdown)
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(Theme.secondaryText)
            .tint(Theme.spotifyGreen)
    }
}

#Preview {
    LinkFooterView(markdown: "前往 [Spotify 官網](https://open.spotify.com)")
        .padding()
}
