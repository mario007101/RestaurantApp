import SwiftUI

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var categories = [
Category(image: "fork.knife", title: "Pizza"),
Category(image: "phone", title: "Kontakt")
]

var topPizza = [
Category(image: "phone", title: "Všetky pizze"),
Category(image: "chevron.right", title: "Top pizze")
]
