import SwiftUI

struct TopBar: View {
    @Binding var isClicked: Bool
    
    var body: some View {
        
        HStack {
            Image("podKastielomLogo")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.leading, 20)
            
            Spacer()
            
            Button(action: { isClicked.toggle() },
                   label: {
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
        .padding(.top, 30)
    }
}


