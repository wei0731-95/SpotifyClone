import SwiftUI

/// 底部的迷你播放器
struct MiniPlayerView: View {
    let song: Song

    var body: some View {
        HStack(spacing: 9) {
            Image(song.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 3))

            VStack(alignment: .leading, spacing: 2) {
                Text(song.title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.white)
                HStack(spacing: 0) {
                    Text(song.artist)
                        .foregroundStyle(.white.opacity(0.7))
                    Text(" • ")
                        .foregroundStyle(.white.opacity(0.7))
                    Text(song.quality)
                        .foregroundStyle(Theme.spotifyGreen)
                }
                .font(.system(size: 13, weight: .semibold))
            }
            .lineLimit(1)

            Spacer(minLength: 4)

            HStack(spacing: 20) {
                DevicesIcon()
                    .stroke(.white, style: StrokeStyle(lineWidth: 1.8, lineCap: .round, lineJoin: .round))
                    .frame(width: 24, height: 20)

                Image(systemName: "checkmark.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black, Theme.spotifyGreen)
                    .font(.system(size: 22))
                    .frame(width: 24)

                Image(systemName: "play.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.white)
                    .frame(width: 24)
            }
            .padding(.trailing, 17)
        }
        .padding(.leading, 8)
        .frame(height: 56)
        .background(RoundedRectangle(cornerRadius: 6).fill(song.playerColor))
        .overlay(alignment: .bottom) {
            // 播放進度
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule().fill(.white.opacity(0.3))
                    Capsule().fill(.white)
                        .frame(width: max(proxy.size.width * song.progress, 3))
                }
            }
            .frame(height: 2)
            .padding(.horizontal, 9)
        }
    }
}

/// 「連接裝置」圖示：左邊一個框 + 右邊一個喇叭
struct DevicesIcon: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        var path = Path()
        // 左邊的螢幕 + 底座
        path.move(to: CGPoint(x: w * 0.42, y: h * 0.1))
        path.addLine(to: CGPoint(x: w * 0.06, y: h * 0.1))
        path.addLine(to: CGPoint(x: w * 0.06, y: h * 0.72))
        path.addLine(to: CGPoint(x: w * 0.42, y: h * 0.72))
        path.move(to: CGPoint(x: w * 0.2, y: h * 0.95))
        path.addLine(to: CGPoint(x: w * 0.34, y: h * 0.95))
        // 右邊的喇叭
        path.addRoundedRect(in: CGRect(x: w * 0.52, y: 0, width: w * 0.44, height: h),
                            cornerSize: CGSize(width: 3, height: 3))
        path.addEllipse(in: CGRect(x: w * 0.62, y: h * 0.48, width: w * 0.24, height: w * 0.24))
        path.addEllipse(in: CGRect(x: w * 0.725, y: h * 0.2, width: w * 0.03, height: w * 0.03))
        return path
    }
}

#Preview {
    MiniPlayerView(song: SampleData.nowPlaying)
        .padding()
}
