import SwiftUI

/// 首頁上方 2 欄的捷徑卡片
struct Shortcut: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var isArtist = false          // 歌手用圓形頭像
    var hasNewContent = false     // 右邊的綠色三個點
}

/// 電台卡片
struct RadioStation: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let imageSlug: String         // 圖片名稱：<slug>_left / <slug>_center / <slug>_right
}

/// 一般的專輯 / 歌單卡片
struct Album: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}

/// 正在播放的歌曲
struct Song {
    let title: String
    let artist: String
    let quality: String
    let imageName: String
    let playerColor: Color
    let progress: Double
}
