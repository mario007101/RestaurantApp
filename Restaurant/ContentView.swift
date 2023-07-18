import SwiftUI

struct ContentView: View {
    @State private var isClicked = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack{
                
                HStack {
                    TopBar(isClicked: $isClicked)
                }
 
                if isClicked == false {
                    VStack {
                        FixedView()
                            .padding(.top)
                        Spacer()
                    }
                } else {
                    VStack{
                        Start()
                    }
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
