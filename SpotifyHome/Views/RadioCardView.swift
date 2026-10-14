import SwiftUI

/// 電台卡片：色塊背景 + 三個圓形頭像 + 大標題
struct RadioCardView: View {
    let station: RadioStation
    var size: CGFloat = 149

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack {
                station.color

                // 左右兩個小頭像，中間一個大頭像（外圈用卡片顏色隔開）
                artistCircle("\(station.imageSlug)_left", diameter: size * 0.385)
                    .offset(x: -size * 0.365, y: -size * 0.07)
                artistCircle("\(station.imageSlug)_right", diameter: size * 0.385)
                    .offset(x: size * 0.365, y: -size * 0.07)
                artistCircle("\(station.imageSlug)_center", diameter: size * 0.535)
                    .overlay(Circle().stroke(station.color, lineWidth: 3))
                    .offset(y: -size * 0.07)

                VStack(alignment: .leading) {
                    HStack {
                        SpotifyLogo(lineColor: station.color)
                            .frame(width: 11, height: 11)
                        Spacer()
                        Text("電台")
                            .font(.system(size: 8, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Text(station.title)
                        .font(.system(size: 22, weight: .heavy))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                }
                .padding(.horizontal, 6)
                .padding(.top, 6)
                .padding(.bottom, 6)
            }
            .frame(width: size, height: size)
            .clipShape(RoundedRectangle(cornerRadius: 4))

            Text(station.subtitle)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(Theme.secondaryText)
                .lineLimit(2)
                .lineSpacing(3)
                .frame(width: size, alignment: .leading)
        }
    }

    private func artistCircle(_ name: String, diameter: CGFloat) -> some View {
        Image(name)
            .resizable()
            .scaledToFill()
            .frame(width: diameter, height: diameter)
            .clipShape(Circle())
    }
}

#Preview {
    RadioCardView(station: SampleData.recommendedStations[0])
        .padding()
        .preferredColorScheme(.dark)
}
