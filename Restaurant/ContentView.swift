import SwiftUI

struct ContentView: View {
    @State var selectedTab = "Home"

    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack{
                
                HStack {
                    Image("podKastielomLogo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Button(action: {
                    }, label: {
                        Image(systemName: "circle.grid.2x2")
                            .font(.title2)
                            .padding(10)
                            .background(CustomColors.typicalColor.opacity(0.52))
                            .foregroundColor(Color.black)
                            .cornerRadius(8)
                    }).padding()
                }
                .background(CustomColors.navigationColor)
                .overlay(
                    
                    HStack(spacing: 4) {
                        
                        Image(systemName: "map")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color.black)
                        
                        Text("Rumanová 12")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                    }
                    .background(CustomColors.navigationColor)
                )
                .padding(.bottom, -5)
                .padding(.top, -25)
                
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
                        })
                    })
                    .padding(.leading)
                    
                    Spacer(minLength: 0)
                    
                }
                .padding()
                .background(CustomColors.navigationColor)
                .cornerRadius(8.0)
                .padding(.horizontal)
                
                
                Color("typicalColor")
                    .background()
                    .ignoresSafeArea()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
