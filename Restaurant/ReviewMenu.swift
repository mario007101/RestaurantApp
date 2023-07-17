import SwiftUI

struct ReviewMenu: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Hey")
            }            
        }.ignoresSafeArea()
         .background(CustomColors.typicalColor)
    }
}

struct ReviewMenu_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMenu()
    }
}
