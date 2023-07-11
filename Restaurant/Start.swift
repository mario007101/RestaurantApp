import SwiftUI

struct Start: View {
    var body: some View {
        VStack(alignment: .center) {
            ScrollView {
                Text("O Nás\n")
                    .font(.largeTitle)
                    .bold()
                
                Image("aboutUs")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 200, height: 200)
                    .padding(.top, -50)
                
                Text("Naša reštaurácia sa nachádza v dedinke Rumanová, neďaleko Nitry. Okolie kaštieľa prepožičiava miestu rustikálny vzhľad, a reštaurácia tak ponúka svojim stravníkom historickú atmosféru.")
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .font(.title2)
                    .padding(.top, 10)
                
                Spacer()
            }            
        }.background(Color.clear)
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
