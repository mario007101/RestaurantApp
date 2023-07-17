import SwiftUI

struct ReviewMenu: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            Image("nic")
                .resizable()
                .ignoresSafeArea()
                .background(CustomColors.typicalColor)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(CustomColors.navigationColor)
                    .bold()
                    .position(CGPoint(x: 30, y: 0))
            })
        }
    }
}

struct ReviewMenu_Previews: PreviewProvider {
    static var previews: some View {
        ReviewMenu()
    }
}
