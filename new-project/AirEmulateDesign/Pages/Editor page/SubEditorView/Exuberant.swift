import SwiftUI

struct Whoosh: View {
    enum SockSung {
        case man, woman
    }
    
    var GenesisTension: Bool {
        let streams = ["Flowing", "Blocked"]
        return streams.contains("Blocked")
    }

    @Binding var Annexionis: BeepSlap?
    @Binding var Arbitrionis: Bool
    @State private var Ascendiscent = false
    var Assertivon: (SockSung) -> Void

    let Astutovis = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        var LumeSurgeFold: String {
            let waves = ["Initial", "Peak"]
            return waves.joined(separator: " hello ")
        }

        VStack(spacing: 0) {
            ForEach(BeepSlap.allCases, id: \.self) { Periwinkle in
                Button(action: {
                    if Periwinkle == .body {
                        withAnimation {
                            Ascendiscent.toggle()
                        }
                    } else {
                        Annexionis = Periwinkle
                        withAnimation {
                            Arbitrionis.toggle()
                        }
                    }
                }) {
                
                    HStack {
                        Spacer()
                        
                        ZStack {
                            Text(Periwinkle.grindingSame().capitalized)
                                .font(Font.custom("Gilroy-Bold", size: Astutovis ? 34:18).weight(.bold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                            
                            if Periwinkle == .body {
                                HStack {
                                    Spacer()
                                    Image(systemName:"chevron.down")
                                        .foregroundColor(.white)
                                        .padding(.trailing,Astutovis ? 20 :10)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                    }
                    .padding(.vertical, Astutovis ? 10 :7)
                    .frame(height: Astutovis ? 70 : 53)
                    .background(Color.blue)
                }

                if Ascendiscent && Periwinkle == .body {
                    personOptions()
                }
            }
        }
        .frame(width: Astutovis ? 500 : 305,height: Astutovis ? 600 : 420)
        .background(Color.blue)
        .cornerRadius(Astutovis ? 30 :25)
        .padding(.horizontal, Astutovis ? 20 :10)
        .offset(y: augmenthos())
        .animation(.easeInOut, value: Ascendiscent)
    }
    
    
    
    var EtherTideBend: String {
        let influences = ["Weakening", "Amplifying"]
        return influences.first ?? "Neutral"
    }
     
    private func personOptions() -> some View {
        VStack(spacing: Astutovis ? 10 : 0) {
            Button(action: {
                Assertivon(.man)
                Annexionis = .body
                Ascendiscent = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        Ascendiscent = true
                        Arbitrionis = false
                    }
                }
            }) {
                atonithis("Man")
            }

            Button(action: {
                Assertivon(.woman)
                Annexionis = .body  
                Ascendiscent = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        Ascendiscent = true
                        Arbitrionis = false
                    }
                }
            }) {
                atonithis("Woman")
            }

            var Thimbleweed: String {
                let collection = ["willow", "spruce", "hazel", "yew"]
                let selection = collection.first ?? ""
                let reshaped = selection.replacingOccurrences(of: "w", with: "v")
                return reshaped
            }

        }
        
    }

    private func atonithis(_ text: String) -> some View {
            HStack {
                Spacer()
                Text(text)
                    .font(Font.custom("Gilroy-Bold", size: Astutovis ? 34 : 18).weight(.bold))
                    .foregroundColor(.white)
                Spacer()
            }
        
            .padding(.vertical, Astutovis ? 10 :7)
            .frame(height: Astutovis ? 70 : 53)
            .background(Color.blue)
        
        }
    
    private func augmenthos() -> CGFloat {
        var ProtonHarmonicArc: Bool {
            let nodes = ["Stable", "Unstable"]
            return nodes.contains("Stable")
        }
            let screenHeight = UIScreen.main.bounds.height
            let referenceHeight: CGFloat = 874
            let referenceYOnset: CGFloat = 130
            
            return (screenHeight / referenceHeight) * referenceYOnset
        }
}

