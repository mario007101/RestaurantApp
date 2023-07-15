import SwiftUI

struct Items: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let gram: Int
    let price: Double
    let ingredients: [String]
}

struct MainCardItems: View {
    let allPizzas: [Items] = [.pizzaStick, .margharita, .sunkova, .funghi, .cardinala, .ungarese]
    let topPizzas: [Items] = [] // Have to finish

    @State private var selectedPizza: Items? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(allPizzas) { item in
                    VStack {
                        HStack {
                            Text("\(item.name) (\(item.gram)g)")
                            Spacer()
                            Text("\(item.price, specifier: "%.2f") €").foregroundColor(CustomColors.typicalColor)

                            Button(action: {
                                withAnimation {
                                    selectedPizza = (selectedPizza == item) ? nil : item
                                }
                            }) {
                                Image(systemName: selectedPizza == item ? "chevron.down" : "chevron.right")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal)
                        .bold()
                        .font(.title2)
                       

                        if selectedPizza == item {
                            ForEach(item.ingredients, id: \.self) { ingredient in
                                
                                Text(ingredient)
                                    .foregroundColor(CustomColors.typicalColor)
                                    .padding(.leading, -140)
                                    .bold()
                            }
                        }
                        Divider()
                    }
                }
            }
        }
        .background {
            CustomColors.navigationColor
                .ignoresSafeArea()
        }
        .frame(height: 300)
    }
}

struct MainCardItems_Previews: PreviewProvider {
    static var previews: some View {
        MainCardItems()
    }
}

extension Items {
    static let pizzaStick = Items(name: "Pizza tyčinky", gram: 350, price: 3.8, ingredients: ["cesnak,", "olivový olej"])
    static let margharita = Items(name: "Margharita", gram: 580, price: 5.5, ingredients: ["paradajková omáčka,", "syr"])
    static let sunkova = Items(name: "Šunková", gram: 640, price: 5.9, ingredients: ["paradajková omáčka,", "syr,", "šunka"])
    static let funghi = Items(name: "Fungi", gram: 710, price: 6.2, ingredients: ["Ingredient 7", "Ingredient 8"])
    static let cardinala = Items(name: "Cardinala", gram: 770, price: 6.8, ingredients: ["Ingredient 9", "Ingredient 10"])
    static let ungarese = Items(name: "Ungarese", gram: 750, price: 7.0, ingredients: ["Ingredient 11", "Ingredient 12"])
}


