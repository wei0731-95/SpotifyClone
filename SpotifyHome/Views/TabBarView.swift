import SwiftUI

/// 最下方的分頁列
struct TabBarView: View {
    let selected: String

    var body: some View {
        HStack(spacing: 0) {
            TabBarItem(title: "首頁", isSelected: selected == "首頁") {
                Image(systemName: "house.fill")
                    .font(.system(size: 23))
            }
            TabBarItem(title: "搜尋", isSelected: selected == "搜尋") {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 23, weight: .medium))
            }
            TabBarItem(title: "你的音樂庫", isSelected: selected == "你的音樂庫") {
                LibraryIcon()
            }
            TabBarItem(title: "建立", isSelected: selected == "建立") {
                Image(systemName: "plus")
                    .font(.system(size: 25, weight: .light))
            }
        }
    }
}

struct TabBarItem<Icon: View>: View {
    let title: String
    let isSelected: Bool
    @ViewBuilder let icon: Icon

    var body: some View {
        VStack(spacing: 5) {
            icon
                .frame(height: 26)
            Text(title)
                .font(.system(size: 11, weight: .medium))
        }
        .foregroundStyle(isSelected ? Theme.primaryText : Theme.secondaryText)
        .frame(maxWidth: .infinity)
    }
}

/// 「你的音樂庫」圖示：兩條直線 + 一本斜頂的書
struct LibraryIcon: View {
    var body: some View {
        HStack(spacing: 4) {
            Capsule().frame(width: 1.8, height: 19)
            Capsule().frame(width: 1.8, height: 19)
            BookShape()
                .stroke(style: StrokeStyle(lineWidth: 1.8, lineJoin: .round))
                .frame(width: 7, height: 18)
        }
    }
}

struct BookShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + rect.width * 0.35, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.height * 0.25))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    TabBarView(selected: "首頁")
        .preferredColorScheme(.dark)
}
