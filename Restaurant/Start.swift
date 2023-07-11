import SwiftUI

struct Start: View {
    let images = ["aboutUs", "podKastielomLogo"]
    public let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    var body: some View {
        VStack(alignment: .center) {
                
                Text("O Nás")
                    .font(.largeTitle)
                    .bold()
                
            VStack {
                TabView(selection: $selection){
                    ForEach(0..<images.count){ i in
                        Image("\(images[i])")
                            .resizable()
                            .frame(width: 200,height: 200)
                            .cornerRadius(20)
                            .padding(.top, -320)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .onReceive(timer, perform: { _ in
                    withAnimation{
                        selection = (selection + 1) % images.count
                    }
                })
            }
                
                Text("Naša reštaurácia sa nachádza v dedinke Rumanová, neďaleko Nitry. Okolie kaštieľa prepožičiava miestu rustikálny vzhľad, a reštaurácia tak ponúka svojim stravníkom historickú atmosféru.")
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .font(.title2)
                    .padding(.top, -450)
                
                Spacer()
            
        }.background(Color.clear)
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
