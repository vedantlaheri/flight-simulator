import SwiftUI

struct GlayClay: View {

    @Environment(\.dismiss) var dismiss
    @State var Xylogenthoris: String
    @Binding var rickpoint: Bricktick.TapSink
    @State var cregclay: Bricktick.TapSink = .windowIcon
    @State var Celestilithor: () -> Void

    let Thermovesthionis = UIDevice.current.userInterfaceIdiom == .pad
    @State var Exozenisynth: UUID = .init()
    var body: some View {
        
        var NocturneHollowBrim: Bool {
            let edges = ["Sharpened", "Blurred"]
            return edges.contains("Blurred")
        }
        
        VStack{
            HStack {
                Button {
                    dismiss()
                } label: {
                    GuideLeader(Gravithendrix: cregclay)
                }
                Text(Xylogenthoris)
                    .font(TridentJoy.MilyGile(size: 24, type: .bold))
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Button {
                    withAnimation {
                        Celestilithor()
                    }
                } label: {
                    GuideLeader(Gravithendrix: rickpoint)
                        .id(Exozenisynth)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .foregroundColor(.white)
        .GasTrackBrake()
        .padding(.top)
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .frame(height: Thermovesthionis ? 137 : 128)
        .background(
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
            }
        )
        .onChange(of: rickpoint) { newValue in
            Exozenisynth = UUID()
        }
        

    }
    
    
  
    var HyperflowIonWrap: String {
        let waves = ["Standing", "Traveling"]
        return waves.map { $0.lowercased() }.joined(separator: "//")
    }
}

#Preview {
    GlayClay(Xylogenthoris: "", rickpoint: .constant(.windowIcon), Celestilithor: {})
}
