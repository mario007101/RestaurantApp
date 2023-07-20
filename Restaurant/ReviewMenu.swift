import SwiftUI

struct ReviewMenu: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack(alignment: .center){
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(CustomColors.navigationColor)
                    .bold()
            }).position(CGPoint(x: 30, y: 0))
            
            
            Text("Zoznam položiek")
                .bold()
                .font(.title2)
                .position(CGPoint(x: 200, y: -350))
            
            
        }.background(CustomColors.typicalColor)
    }
}

struct ReviewMenu_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMenu()
    }
}
