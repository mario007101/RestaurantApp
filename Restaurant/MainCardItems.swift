import SwiftUI

struct Items: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let gram: Int
    let price: Double
    let ingredients: [String]
}

struct PizzaCounter {
    var count = 0
    var selectedItems: [String] = []
}

struct MainCardItems: View {
    let allPizzas: [Items] = [.pizzaStick, .margharita, .sunkova, .funghi, .cardinala, .ungarese]
    let topPizzas: [Items] = [.margharita, .cardinala, .ungarese, .sunkova]

    @State private var selectedPizza: Items? = nil
    @State var selectedCategory: Category = topPizza.first!
    @State private var isSelectedTopPizza = 1
    @State var counters: [UUID: PizzaCounter] = [:]
    @State private var selectedPizzaCounter = PizzaCounter()
    @State private var showReviewMenu = false
    
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
                                if (isSelectedTopPizza == 1) && (selectedCategory.title == "Top pizze") {
                                   isSelectedTopPizza = 2
                                } else if (isSelectedTopPizza == 2) && (selectedCategory.title == "Všetky pizze") {
                                    isSelectedTopPizza = 1
                                }
                            }
                        }
                    }
                }
                .padding(2)
            }
            
            
            ScrollView {
                VStack(alignment: .leading) {
                    if isSelectedTopPizza == 1 {
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
                                .font(.title3)
                                
                                
                                if selectedPizza == item {
                                    ForEach(item.ingredients, id: \.self) { ingredient in
                                        
                                        Text(ingredient)
                                            .foregroundColor(CustomColors.typicalColor)
                                            .padding(.leading, -140)
                                            .bold()
                                        
                                    }
                                    
                                    HStack {
                                        
                                        Button(action: {
                                            decrementCounter(for: item)
                                        }, label: {
                                            Image(systemName: "minus")
                                        })
                                        .disabled(getCounter(for: item) == 0)
                                        
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .cornerRadius(4)
                                                .foregroundColor(Color.black)
                                            
                                            Text("\(getCounter(for: item))")
                                                .foregroundColor(.white)
                                        }
                                        
                                        Button(action: {
                                            incrementCounter(for: item)
                                            selectedPizzaCounter.selectedItems.append(item.name)
                                        }, label: {
                                            Image(systemName: "plus")
                                                .frame(width: 20, height: 20)
                                        })
                                        .disabled(getCounter(for: item) == 10)
                                        
                                    }
                                    .foregroundColor(Color.white)
                                    .frame(width: 20, height: 20)
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
                                .font(.title3)
                                
                                
                                if selectedPizza == item {
                                    ForEach(item.ingredients, id: \.self) { ingredient in
                                        
                                        Text(ingredient)
                                            .foregroundColor(CustomColors.typicalColor)
                                            .padding(.leading, -140)
                                            .bold()
                                    }
                                    
                                    HStack {
                                        
                                        Button(action: {
                                            decrementCounter(for: item)
                                        }, label: {
                                            Image(systemName: "minus")
                                        })
                                        .disabled(getCounter(for: item) == 0)
                                        
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .cornerRadius(4)
                                                .foregroundColor(Color.black)
                                            
                                            Text("\(getCounter(for: item))")
                                                .foregroundColor(.white)
                                        }
                                        
                                        Button(action: {
                                            incrementCounter(for: item)
                                        }, label: {
                                            Image(systemName: "plus")
                                                .frame(width: 20, height: 20)
                                        })
                                        .disabled(getCounter(for: item) == 10)
                                        
                                        
                                        
                                    }
                                    .foregroundColor(Color.white)
                                    .frame(width: 20, height: 20)

                                }
                            
                                Divider()
                            }
                        }
                    }
            }.frame(height:350)}
            .background {
                CustomColors.navigationColor
                    .ignoresSafeArea()
            }
        }.sheet(isPresented: $showReviewMenu) {
            ReviewMenu(selectedPizzaCounter: selectedPizzaCounter)
        }
    }
    

    private func incrementCounter(for item: Items) {
                if let index = allPizzas.firstIndex(of: item) {
                    let itemId = allPizzas[index].id
                    if counters[itemId] == nil {
                        counters[itemId] = PizzaCounter()
                    }
                    counters[itemId]?.count += 1
                }
            }
            
            private func decrementCounter(for item: Items) {
                if let index = allPizzas.firstIndex(of: item) {
                    let itemId = allPizzas[index].id
                    if counters[itemId] == nil {
                        counters[itemId] = PizzaCounter()
                    }
                    counters[itemId]?.count -= 1
                }
            }

        
    private func getCounter(for item: Items) -> Int {
        if let index = allPizzas.firstIndex(of: item) {
            let itemId = allPizzas[index].id
            if counters[itemId] == nil {
                counters[itemId] = PizzaCounter()
            }
            let count = counters[itemId]?.count ?? 0
            
            // If count becomes 1, add the item name to selectedItems array
            if count == 1 {
                if !selectedPizzaCounter.selectedItems.contains(item.name) {
                    selectedPizzaCounter.selectedItems.append(item.name)
                }
            }
            
            return count
        }
        
        return 0
    }
    
}

struct MainCardItems_Previews: PreviewProvider {
    static var previews: some View {
        MainCardItems()
    }
}

//Have to add some more items
extension Items: Hashable {
    static let pizzaStick = Items(name: "Pizza tyčinky", gram: 350, price: 3.8, ingredients: ["cesnak,", "olivový olej"])
    static let margharita = Items(name: "Margharita", gram: 580, price: 5.5, ingredients: ["paradajková omáčka,", "syr"])
    static let sunkova = Items(name: "Šunková", gram: 640, price: 5.9, ingredients: ["paradajková omáčka,", "syr,", "šunka"])
    static let funghi = Items(name: "Fungi", gram: 710, price: 6.2, ingredients: ["paradajková omáčka,", "syr,", "šunka,", "šampióny"])
    static let cardinala = Items(name: "Cardinala", gram: 770, price: 6.8, ingredients: ["paradajková omáčka,", "syr,", "šunka,", "šampióny,", "kukurica"])
    static let ungarese = Items(name: "Ungarese", gram: 750, price: 7.0, ingredients: ["paradajková omačka,", "slanina,", "pikantná klobása,", "cibuľa,", "feferóny,", "syr"])
}


