import SwiftUI

struct Start: View {
    let images = ["aboutUs", "podKastielomLogo"]
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    var body: some View {
        VStack(alignment: .center) {
                
                Text("O Nás\n")
                    .font(.largeTitle)
                    .bold()
                
            VStack(alignment: .center) {
                    TabView(selection: $selection){
                        ForEach(0..<2){ i in
                            Image("\(images[i])")
                                .resizable()
                                .frame(width: 200,height: 200)
                                .ignoresSafeArea()
                                .cornerRadius(20)
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .onReceive(timer, perform: { _ in
                            withAnimation{
                                selection = selection < 3 ? selection + 1 : 0
                            }
                        })
                }.padding(.top, -570)
                
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
