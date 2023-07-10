import SwiftUI

struct Start: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("O Nás\n")
                .font(.largeTitle)
                .bold()
            
            Text("Naša reštaurácia sa nachádza v dedinke Rumanová, neďaleko Nitry. Okolie kaštieľa prepožičiava miestu rustikálny vzhľad, a reštaurácia tak ponúka svojim stravníkom historickú atmosféru.")
                .multilineTextAlignment(.center)
                .frame(width: 300)
                .font(.title2)
                .padding(.top, -50)
            
            Spacer()
            
        }.background(Color.clear)
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
