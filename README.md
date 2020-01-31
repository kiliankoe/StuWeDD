# 🎓 EmealKit

Swift library for accessing some of the data the [Studentenwerk Dresden](http://www.studentenwerk-dresden.de/) has to offer.



## Quick Start

Talk to the [Cardservice](www.studentenwerk-dresden.de/mensen/kartenservice/) to acquire data about your Emeal card. You will need to have registered for Autoload to have the necessary authentication details.

```swift
Cardservice.login(username: "1234567890", password: "hunter2") { result in
    guard let service = result.success else { return }
    
    service.carddata { result in
        guard let data = result.success else { return }
        print(data)
    }
    
    let twoDaysAgo = Date().addingTimeInterval(-60 * 60 * 24 * 2)
    let now = Date()
    service.transactions(begin: twoDaysAgo, end: now) { result in
        guard let transactions = result.success else { return }
        print(transactions)
    }
}
```

Or get current meal information.

```swift
Meal.for(canteen: .alteMensa, on: Date()) { result in
    guard let meals = result.success else { return }
    
    for meal in meals {
        print(meal.name)
    }
}
```

Or a list of canteens.

```swift
Canteen.all { result in
    guard let canteens = result.success else { return }
    
    for canteen in canteens {
        print(canteen.name)
    }
}
```


## Installation

StuWeDD is available through Swift Package Manager.

```swift
.package(url: "https://github.com/kiliankoe/EmealKit.git", from: "<#latest#>")
```
