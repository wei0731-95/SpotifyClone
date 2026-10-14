import SwiftUI

enum SampleData {
    static let filters = ["所有", "音樂", "Podcast"]

    static let shortcuts: [Shortcut] = [
        Shortcut(title: "騎車", imageName: "cover_riding", hasNewContent: true),
        Shortcut(title: "HeartBreakFast 傷心早餐店", imageName: "cover_heartbreakfast"),
        Shortcut(title: "終於了解自由 (Deluxe)", imageName: "cover_freedom"),
        Shortcut(title: "愛，教會我們的事", imageName: "cover_love"),
        Shortcut(title: "安泰", imageName: "cover_antai"),
        Shortcut(title: "周杰倫激推經典神曲 TOP 50！", imageName: "cover_top50"),
        Shortcut(title: "陳華", imageName: "artist_chenhua", isArtist: true),
        Shortcut(title: "周杰倫", imageName: "artist_jay", isArtist: true),
    ]

    static let recommendedStations: [RadioStation] = [
        RadioStation(title: "不要在一起",
                     subtitle: "盧廣仲, 曾沛慈, 宇宙人, icyball 冰球樂團, Crispy脆樂團",
                     color: Color(red: 0.81, green: 0.96, blue: 0.42), imageSlug: "buyao"),
        RadioStation(title: "趙翊帆",
                     subtitle: "PIZZALI, Gummy B, 趙翊帆, thehopend, E1and",
                     color: Color(red: 0.99, green: 0.62, blue: 0.47), imageSlug: "zhao"),
        RadioStation(title: "TRASH",
                     subtitle: "美秀集團, Lee, 周湯豪, 告五人, 拍謝少年",
                     color: Color(red: 0.99, green: 0.61, blue: 0.65), imageSlug: "trash"),
        RadioStation(title: "陳忻玥",
                     subtitle: "高爾宣 OSN, 陳忻玥, TRASH, 謝和弦, 王謙Go…",
                     color: Color(red: 0.88, green: 0.75, blue: 0.44), imageSlug: "xinyue"),
    ]

    static let popularStations: [RadioStation] = [
        RadioStation(title: "A-Lin",
                     subtitle: "A-Lin, 田馥甄, 蔡健雅, 林憶蓮, 徐佳瑩",
                     color: Color(red: 0.57, green: 0.57, blue: 0.81), imageSlug: "alin"),
        RadioStation(title: "美秀集團",
                     subtitle: "美秀集團, 告五人, 草東沒有派對, 落日飛車, 拍謝少年",
                     color: Color(red: 0.88, green: 0.75, blue: 0.44), imageSlug: "mayhsiu"),
        RadioStation(title: "告五人",
                     subtitle: "告五人, 盧廣仲, 韋禮安, 吳青峰, 理想混蛋",
                     color: Color(red: 0.60, green: 0.61, blue: 0.88), imageSlug: "accusefive"),
    ]

    static let recentlyPlayed: [Album] = [
        Album(title: "HeartBreakFast 傷心早餐店", subtitle: "專輯・盧廣仲", imageName: "cover_heartbreakfast"),
        Album(title: "安泰", subtitle: "歌單・Spotify", imageName: "cover_antai"),
        Album(title: "終於了解自由 (Deluxe)", subtitle: "專輯・周興哲", imageName: "cover_freedom"),
        Album(title: "愛，教會我們的事", subtitle: "專輯・韋禮安", imageName: "cover_love"),
    ]

    static let nowPlaying = Song(title: "太陽與地球",
                                 artist: "盧廣仲",
                                 quality: "無損音質",
                                 imageName: "cover_heartbreakfast",
                                 playerColor: Color(red: 0.48, green: 0.22, blue: 0.45),
                                 progress: 0.02)
}
