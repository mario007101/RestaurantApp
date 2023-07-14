import SwiftUI

struct Items: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    
    var items: [Items]?
}

struct MainCardItems: View {
    let allPizzas: [Items] = [.pizzas]
    
    var body: some View {
        ZStack {
            List(allPizzas, children: \.items) { item in
                Text(item.name)
                Text("\(item.price, specifier: "%.2f") €").padding(.leading, 90)
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
    static let pizzaStick = Items(name: "Pizza tyčinky", price: 3.8)
    static let margharita = Items(name: "Margharita", price: 5.5)
    
    static let pizzas = Items(name: "Pizza", price: 0.0, items: [Items.margharita, Items.pizzaStick])
}
