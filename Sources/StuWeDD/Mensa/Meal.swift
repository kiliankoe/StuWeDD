import Foundation

public struct Meal {
    public let id: String
    public let name: String
    public let mensa: String
    public let price: Price?

    public let url: URL
    public let imageURL: URL?

    public let isSoldOut: Bool

    public struct Price {
        let student: Double
        let employee: Double
    }

    private static let pricesRgx = try! NSRegularExpression(pattern: "(\\d+.\\d+)")
    private static let idRgx = try! NSRegularExpression(pattern: "details-(\\d+).html")

    init?(from dict: [String: String]) {
        guard
            let title = dict["title"],
            let urlStr = dict["link"],
            let url = URL(string: urlStr),
            let mensa = dict["author"]
        else {
            return nil
        }

        self.id = Meal.idRgx.match(in: urlStr) ?? ""
        self.name = title
        self.mensa = mensa

        if let _ = title.range(of: " \\(.*\\)", options: .regularExpression) {
            let prices = Meal.pricesRgx.matches(in: title)
                .flatMap(Double.init)
            if prices.count == 1 {
                self.price = Price(student: prices[0], employee: prices[0])
            } else if prices.count == 2 {
                self.price = Price(student: prices[0], employee: prices[1])
            } else {
                self.price = nil
            }
        } else {
            self.price = nil
        }
        self.url = url
        self.imageURL = nil
        self.isSoldOut = false
    }
}
