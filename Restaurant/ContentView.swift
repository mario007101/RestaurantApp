import SwiftUI

struct ContentView: View {
    @State var selectedTab = "Home"
    @State private var isClicked = false
    @Namespace var animation
    
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
                        isClicked = true
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
                
                Color("typicalColor")
                    .background()
                    .ignoresSafeArea()
            }
            if isClicked == true {
                
                VStack(content: {
                    VStack(alignment: .trailing, spacing: 0) {
                        TabMenu(image: "house", title: "Úvod", selectedTab: $selectedTab, animation: animation)
                        TabMenu(image: "house", title: "Špeciálne akcie", selectedTab: $selectedTab, animation: animation)
                        TabMenu(image: "house", title: "Denné menu", selectedTab: $selectedTab, animation: animation)
                        TabMenu(image: "fork.knife", title: "Jedálny lístok", selectedTab: $selectedTab, animation: animation)
                        TabMenu(image: "photo.artframe", title: "Fotogaléria", selectedTab: $selectedTab, animation: animation)
                        TabMenu(image: "phone", title: "Kontakt", selectedTab: $selectedTab, animation: animation)
                    }
                    .padding(.top, 70)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                })
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
