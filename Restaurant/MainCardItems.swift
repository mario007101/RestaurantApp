import SwiftUI

struct Items: Identifiable {
    let id = UUID()
    let name: String
    
    var items: [Items]?
}

struct MainCardItems: View {
    let allPizzas: [Items] = [.pizzaStick]
    var body: some View {
        ZStack {
            List(allPizzas, children: \.items) { item in
                Text(item.name)
            }
            .environment(\.defaultMinListRowHeight, 50)
            .environment(\.defaultMinListHeaderHeight, 45)
            .scrollContentBackground(.hidden)
            .background() {
                CustomColors.navigationColor
                    .ignoresSafeArea()
                
               }
            
        }
    }
}

struct MainCardItems_Previews: PreviewProvider {
    static var previews: some View {
        MainCardItems()
    }
}

extension Items {
    static let pizzaStick = Items(name: "Pizza tyčinky")
    
    
    static let pizza = Items(name: "Pizza", items: [Items.pizzaStick])
}
