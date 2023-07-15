import SwiftUI

struct Items: Identifiable {
    let id = UUID()
    let name: String
    let gram: Int
    let price: Double
}

struct MainCardItems: View {
    let allPizzas: [Items] = [.pizzaStick, .margharita, .sunkova, .funghi, .cardinala, .ungarese]
    
    let topPizzas //Have to finish
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(allPizzas) { item in
                    VStack {
                        HStack {
                            Text("\(item.name) (\(item.gram)g)")
                            Spacer()
                            Text("\(item.price, specifier: "%.2f") €")
                        }
                        .padding(.horizontal)
                        .bold()
                        .font(.title2)
                        Divider()
                    }
                }
            }
        }
        .background {
            CustomColors.navigationColor
                .ignoresSafeArea()
        }
    }
}

struct MainCardItems_Previews: PreviewProvider {
    static var previews: some View {
        MainCardItems()
    }
}

extension Items {
    static let pizzaStick = Items(name: "Pizza tyčinky", gram: 350, price: 3.8)
    static let margharita = Items(name: "Margharita", gram: 580, price: 5.5)
    static let sunkova = Items(name: "Šunková", gram: 640, price: 5.9)
    static let funghi = Items(name: "Fungi", gram: 710, price: 6.2)
    static let cardinala = Items(name: "Cardinala", gram: 770, price: 6.8)
    static let ungarese = Items(name: "Ungarese", gram: 750, price: 7.0)
}

