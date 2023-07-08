import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            
            HStack {
                
                Image("podKastielomLogo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.leading, 10)
                
                Spacer()
                    
                Button(action: {
                    
                }, label: {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title2)
                        .padding(10)
                        .background(Color.gray.opacity(0.12))
                        .foregroundColor(Color.black)
                        .cornerRadius(8)
                }).padding()
            }
             
             .overlay(
                
                HStack(spacing: 4) {
                    
                    Image(systemName: "map")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.black)
                    
                    Text("Rumanová 12")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                }
             )
             .padding().padding(.top, -20)
            
            Color("typicalColor").background().ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
