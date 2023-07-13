import SwiftUI

struct FixedView: View {
    @State var selectedCategory: Category = categories.first!
    @State var mainMenu = true
    @State var contact = false
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 5, content: {
                    (
                        Text("Rýchle doručenie objednávok ")
                        +
                        Text("jedla")
                            .foregroundColor(CustomColors.typicalColor)
                    )
                    .font(.title)
                    .fontWeight(.bold)
                    
                    Button(action: {}, label: {
                        Text("Objednať")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.indigo)
                            .clipShape(Capsule())
                            .padding(.leading, 190)
                            .padding(.top, 20)
                    })
                })
                .padding(.leading)
                
                Spacer()
            }
            .padding()
            .background(CustomColors.navigationColor)
            .cornerRadius(8.0)
            .padding(.horizontal)
            
            Text("Kategórie")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .padding(.top, 0)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories) { category in
                        HStack(spacing: 10) {
                            Image(systemName: category.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .padding(6)
                                .background(selectedCategory.id == category.id ? Color.white : Color.clear)
                                .clipShape(Circle())
                            
                            Text(category.title)
                                .fontWeight(.bold)
                                .foregroundColor(selectedCategory.id == category.id ? .white : .black)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .padding(.leading, 2)
                        .background(selectedCategory.id == category.id ? CustomColors.navigationColor : Color.gray.opacity(0.3))
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedCategory = category
                                
                                if category.title == "Hlavné jedlá" {
                                    mainMenu = true
                                    contact = false
                                } else if category.title == "Kontakt" {
                                    contact = true
                                    mainMenu = false
                                }
                            }
                        }
                    }.padding(.leading, 10)
                }
            }
            
            if contact {
                VStack(alignment: .leading) {
                    Text("New HStack Content")
                }
                .padding()
                .background(CustomColors.navigationColor)
                .cornerRadius(8.0)
                .padding()
            } else if mainMenu {
                VStack(alignment: .leading) {
                    Text("New HStack Contents")
                        
                }
                .padding()
                .background(CustomColors.navigationColor)
                .cornerRadius(8.0)
                .padding()
            }
            
            Spacer()
        }
    }
}

struct FixedView_Previews: PreviewProvider {
    static var previews: some View {
        FixedView()
    }
}
