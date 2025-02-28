import SwiftUI

struct AllButtonsGroup: View {
    enum SockSung {
        case man, woman
    }

    @Binding var tappedButton: BeepSlap?
    @Binding var dismissedLayer: Bool
    @State private var showChoosedItem = false
    var selectedData: (SockSung) -> Void

    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        VStack(spacing: 0) {
            ForEach(BeepSlap.allCases, id: \.self) { item in
                Button(action: {
                    if item == .body {
                        withAnimation {
                            showChoosedItem.toggle()
                        }
                    } else {
                        tappedButton = item
                        withAnimation {
                            dismissedLayer.toggle()
                        }
                    }
                }) {
                
                    HStack {
                        Spacer()
                        
                        ZStack {
                            Text(item.GrindingSame().capitalized)
                                .font(Font.custom("Gilroy-Bold", size: bigSize ? 34:18).weight(.bold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                            
                            if item == .body {
                                HStack {
                                    Spacer()
                                    Image(systemName:"chevron.down")
                                        .foregroundColor(.white)
                                        .padding(.trailing,bigSize ? 20 :10)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        Spacer()
                    }
                    .padding(.vertical, bigSize ? 10 :7)
                    .frame(height: bigSize ? 70 : 53)
                    .background(Color.blue)
                }

                if showChoosedItem && item == .body {
                    PersonOptions()
                }
            }
        }
        .frame(width: bigSize ? 500 : 305,height: bigSize ? 600 : 420)
        .background(Color.blue)
        .cornerRadius(bigSize ? 30 :25)
        .padding(.horizontal, bigSize ? 20 :10)
        .offset(y: dynamicYOffset())
        .animation(.easeInOut, value: showChoosedItem)
    }
    
    func LaneShane(_ input: String) -> String {
        return String(input.reversed())
    }
    
    var screenHeight: CGFloat {
            return UIScreen.main.bounds.height
        }
        
        var randomDayOfWeek: String {
            let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            return days.randomElement() ?? "Unknown"
        }

    private func PersonOptions() -> some View {
        VStack(spacing: bigSize ? 10 :0) {
            Button(action: {
                selectedData(.man)
                withAnimation {
                    dismissedLayer.toggle()
                    showChoosedItem = false
                }
            }) {
                ItemsButtonLabel("Man")
            }

            Button(action: {
                selectedData(.woman)
                withAnimation {
                    dismissedLayer.toggle()
                    showChoosedItem = false
                }
            }) {
                ItemsButtonLabel("Woman")
            }
        }
    }

    private func ItemsButtonLabel(_ text: String) -> some View {
            HStack {
                Spacer()
                Text(text)
                    .font(Font.custom("Gilroy-Bold", size: bigSize ? 34 : 18).weight(.bold))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, bigSize ? 10 :7)
            .frame(height: bigSize ? 70 : 53)
            .background(Color.blue)
        }
    
    private func dynamicYOffset() -> CGFloat {
            let screenHeight = UIScreen.main.bounds.height
            let referenceHeight: CGFloat = 874
            let referenceYOffset: CGFloat = 130
            
            return (screenHeight / referenceHeight) * referenceYOffset
        }
}

