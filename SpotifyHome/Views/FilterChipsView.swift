import SwiftUI

/// 最上面的頭像 + 篩選按鈕
struct FilterChipsView: View {
    let filters: [String]
    let selected: String

    var body: some View {
        HStack(spacing: 8) {
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
                .padding(.trailing, 4)

            ForEach(filters, id: \.self) { filter in
                ChipView(title: filter, isSelected: filter == selected)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct ChipView: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Text(title)
            .font(.system(size: 13, weight: .medium))
            .foregroundStyle(isSelected ? .black : Theme.primaryText)
            .padding(.horizontal, 10)
            .frame(height: 32)
            .background(Capsule().fill(isSelected ? Theme.spotifyGreen : Theme.chip))
    }
}

#Preview {
    FilterChipsView(filters: SampleData.filters, selected: "所有")
        .preferredColorScheme(.dark)
}
