import SwiftUI

/// 兩欄的捷徑卡片
struct ShortcutGridView: View {
    let shortcuts: [Shortcut]
    var spacing: CGFloat = 8

    private var rows: [[Shortcut]] {
        stride(from: 0, to: shortcuts.count, by: 2).map {
            Array(shortcuts[$0..<min($0 + 2, shortcuts.count)])
        }
    }

    var body: some View {
        VStack(spacing: spacing) {
            ForEach(rows.indices, id: \.self) { index in
                HStack(spacing: spacing) {
                    ForEach(rows[index]) { shortcut in
                        ShortcutCardView(shortcut: shortcut)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ShortcutCardView: View {
    let shortcut: Shortcut
    var height: CGFloat = 48

    var body: some View {
        HStack(spacing: 8) {
            artwork

            Text(shortcut.title)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(Theme.primaryText)
                .lineLimit(2)
                .lineSpacing(1)

            Spacer(minLength: 0)

            if shortcut.hasNewContent {
                HStack(spacing: 2) {
                    ForEach(0..<3, id: \.self) { _ in
                        Circle()
                            .fill(Theme.spotifyGreen)
                            .frame(width: 3, height: 3)
                    }
                }
            }
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(Theme.card)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }

    @ViewBuilder
    private var artwork: some View {
        if shortcut.isArtist {
            Image(shortcut.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: height - 4, height: height - 4)
                .clipShape(Circle())
                .frame(width: height, height: height)
        } else {
            Image(shortcut.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: height, height: height)
                .clipped()
        }
    }
}

#Preview {
    ShortcutGridView(shortcuts: SampleData.shortcuts)
        .preferredColorScheme(.dark)
}
