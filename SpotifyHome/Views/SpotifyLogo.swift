import SwiftUI

/// Spotify 圓形標誌：黑色圓 + 三條弧線
struct SpotifyLogo: View {
    var lineColor: Color = Theme.spotifyGreen

    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            context.fill(Path(ellipseIn: CGRect(origin: .zero, size: size)), with: .color(.black))

            // (高度, 左右內縮, 線寬)
            let waves: [(CGFloat, CGFloat, CGFloat)] = [(0.36, 0.2, 0.11), (0.53, 0.25, 0.09), (0.69, 0.3, 0.075)]
            for (y, inset, lineWidth) in waves {
                var path = Path()
                path.move(to: CGPoint(x: w * inset, y: h * y))
                path.addQuadCurve(to: CGPoint(x: w * (1 - inset + 0.03), y: h * (y + 0.05)),
                                  control: CGPoint(x: w * 0.5, y: h * (y - 0.1)))
                context.stroke(path, with: .color(lineColor),
                               style: StrokeStyle(lineWidth: w * lineWidth, lineCap: .round))
            }
        }
    }
}

#Preview {
    SpotifyLogo(lineColor: .yellow)
        .frame(width: 80, height: 80)
}
