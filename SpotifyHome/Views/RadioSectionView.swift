import SwiftUI

/// 區塊標題 + 可以左右滑動的電台卡片
struct RadioSectionView: View {
    let title: String
    let stations: [RadioStation]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SectionTitle(text: title)

            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(stations) { station in
                        RadioCardView(station: station)
                    }
                }
                .padding(.horizontal, 18)
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct SectionTitle: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 21, weight: .bold))
            .foregroundStyle(Theme.primaryText)
            .padding(.horizontal, 16)
    }
}

#Preview {
    RadioSectionView(title: "電台推薦", stations: SampleData.recommendedStations)
        .preferredColorScheme(.dark)
}
