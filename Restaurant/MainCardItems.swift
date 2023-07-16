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
    
    //These have to finish
    let topPizzas: [Items] = [.margharita, .cardinala]

    @State private var selectedPizza: Items? = nil
    @State var selectedCategory: Category = topPizza.first!
    @State private var isSelectedTopPizza = false
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(topPizza) { pizza in
                        HStack(spacing: 10) {
                            Image(systemName: pizza.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .padding(6)
                                .background(selectedCategory.id == pizza.id ? Color.white : Color.clear)
                                .clipShape(Circle())
                            
                            Text(pizza.title)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory.id == pizza.id ? .white : .black)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .padding(.leading, 2)
                        .background(selectedCategory.id == pizza.id ? CustomColors.navigationColor : Color.gray.opacity(0.3))
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedCategory = pizza
                                if isSelectedTopPizza == false {
                                   isSelectedTopPizza = true
                                } else {
                                    isSelectedTopPizza = false
                                }
                            }
                        }
                    }
                }
                .padding(2)
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    if isSelectedTopPizza == false {
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
                    } else {
                        ForEach(topPizzas) { item in
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
            }.frame(height:200)}
            .background {
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
    static let pizzaStick = Items(name: "Pizza tyčinky", gram: 350, price: 3.8, ingredients: ["cesnak,", "olivový olej"])
    static let margharita = Items(name: "Margharita", gram: 580, price: 5.5, ingredients: ["paradajková omáčka,", "syr"])
    static let sunkova = Items(name: "Šunková", gram: 640, price: 5.9, ingredients: ["paradajková omáčka,", "syr,", "šunka"])
    
    //Have to finish these
    static let funghi = Items(name: "Fungi", gram: 710, price: 6.2, ingredients: ["Ingredient 7", "Ingredient 8"])
    static let cardinala = Items(name: "Cardinala", gram: 770, price: 6.8, ingredients: ["Ingredient 9", "Ingredient 10"])
    static let ungarese = Items(name: "Ungarese", gram: 750, price: 7.0, ingredients: ["Ingredient 11", "Ingredient 12"])
}


