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
    }
}

struct FixedView_Previews: PreviewProvider {
    static var previews: some View {
        FixedView()
    }
}
