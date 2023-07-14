import SwiftUI

struct Items: Identifiable {
    let id = UUID()
    let name: String
    var items: [Items]?
}

struct MainCardItems: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainCardItems_Previews: PreviewProvider {
    static var previews: some View {
        MainCardItems()
    }
}

extension Items {
    static let pizza = Items(name: "Margarita")
}
