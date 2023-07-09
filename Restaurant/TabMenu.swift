import SwiftUI

struct TabMenu: View {
    var image: String = "house"
    var title: String = "home"
    
    @Binding var selectedTab: String
    
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            
           }, label: {
            
            HStack(spacing: 10) {
                
                Text(title)
                    .fontWeight(.semibold)
                
                Image(systemName: image)
                    .font(.title2)
                
                
            }
            .foregroundColor(selectedTab == title ? Color.blue : CustomColors.navigationColor)
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(
                Color.white.opacity(selectedTab == title ? 1 : 0)
                    .clipShape(CustomCorners(corners: [.topLeft, .bottomLeft], radius: 10))
            )
        })
    }
}


