import SwiftUI

struct FixedView: View {   
    
    var body: some View {
        
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
                
                Button(action: {  }, label: {
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
            .padding(.top, -20)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            HStack(spacing: 15) {
                
                ForEach(categories) { category in
                    
                    HStack(spacing: 10) {
                        
                        Image(systemName: category.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .padding(6)
                            .background(Color.white)
                            .clipShape(Circle())
                        
                        Text(category.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .padding(.leading, 2)
                    .background(CustomColors.navigationColor)
                    .clipShape(Capsule())
                }
            }
        })
    }
}

struct FixedView_Previews: PreviewProvider {
    static var previews: some View {
        FixedView()
    }
}
