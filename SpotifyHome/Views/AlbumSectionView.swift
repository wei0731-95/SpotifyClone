import SwiftUI

/// 一般的專輯列（最近播放）
struct AlbumSectionView: View {
    let title: String
    let albums: [Album]

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            SectionTitle(text: title)

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(albums) { album in
                        AlbumCardView(album: album)
                    }
                }
                .padding(.horizontal, 18)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct AlbumCardView: View {
    let album: Album
    var size: CGFloat = 149

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(album.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.bottom, 4)
            Text(album.title)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Theme.primaryText)
                .lineLimit(1)
            Text(album.subtitle)
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(Theme.secondaryText)
                .lineLimit(1)
        }
        .frame(width: size, alignment: .leading)
    }
}

#Preview {
    AlbumSectionView(title: "最近播放", albums: SampleData.recentlyPlayed)
        .preferredColorScheme(.dark)
}
