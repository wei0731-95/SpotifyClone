import SwiftUI

/// Spotify 首頁
struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                FilterChipsView(filters: SampleData.filters, selected: "所有")
                    .padding(.top, 9)

                ShortcutGridView(shortcuts: SampleData.shortcuts)
                    .padding(.top, 9)

                RadioSectionView(title: "電台推薦", stations: SampleData.recommendedStations)
                    .padding(.top, 25)

                RadioSectionView(title: "熱門電台", stations: SampleData.popularStations)
                    .padding(.top, 30)

                AlbumSectionView(title: "最近播放", albums: SampleData.recentlyPlayed)
                    .padding(.top, 28)

                LinkFooterView(markdown: "想聽更多？前往 [Spotify 官網](https://open.spotify.com) 或 [下載 Spotify](https://www.spotify.com/tw/download/)。")
                    .padding(.horizontal, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 24)
            }
        }
        .scrollIndicators(.hidden)
        .background(Theme.background)
        .safeAreaInset(edge: .top, spacing: 0) {
            // 狀態列後面補上背景色，捲動時內容不會跟時間重疊
            Color.clear
                .frame(height: 0)
                .background(Theme.background)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            VStack(spacing: 0) {
                MiniPlayerView(song: SampleData.nowPlaying)
                    .padding(.horizontal, 8)
                TabBarView(selected: "首頁")
                    .padding(.top, 13)
            }
            .background {
                // 底部的漸層，讓後面的內容慢慢變暗
                LinearGradient(stops: [
                    .init(color: Theme.background.opacity(0), location: 0),
                    .init(color: Theme.background.opacity(0.75), location: 0.35),
                    .init(color: Theme.background.opacity(0.97), location: 0.6),
                    .init(color: Theme.background, location: 1),
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
