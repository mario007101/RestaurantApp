import SwiftUI

struct Category: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
}

var categories = [
Category(image: "fork.knife", title: "Hlavné jedlá"),
Category(image: "phone", title: "Kontakt")
]
