import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack{
                
                HStack {
                    TopBar()
                }
                
                VStack {
                    FixedView()
                        .padding(.top)
                    
                    Spacer()
                }
                
            }.background(Color("typicalColor")).ignoresSafeArea()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
