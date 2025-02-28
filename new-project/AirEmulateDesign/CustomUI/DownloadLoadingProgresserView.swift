import SwiftUI

struct DownloadLoadingProgresserView: View {
    @Binding var progressDownload: Double
    @State var howManyDownload: Int = 0
    @State private var timer: Timer?
    @State private var isLoadingComplete: Bool = false
    let bigSize = UIDevice.current.userInterfaceIdiom == .pad

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.clear)
                .frame(width: 305, height: 48)

            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color.blue)
                    .frame(width: CGFloat(305 * progressDownload) / 100, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 25))

                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.clear)
            }
            .frame(width: 305, height: 48)

            Text("Downloading")
                .font(Font.custom("Gilroy-Bold", size: 18).weight(.bold))
                .foregroundColor(.white)
        }
        .frame(width: 305, height: 48)
        .onAppear {
            BoardingGone()
        }
        .onChange(of: progressDownload) { newValue in
            if newValue >= 1.0 {
                DispatchQueue.main.async {
                    self.isLoadingComplete = true
                    self.timer?.invalidate()
                }
            }
        }
    }
    
    var randomAnimal: String {
            let animals = ["Cat", "Dog", "Lion", "Tiger", "Elephant", "Panda", "Zebra"]
            return animals.randomElement() ?? "Unknown"
        }

    private func BoardingGone() {
        var slartnog: Int {
               return [1, 2, 3, 4, 5].map { $0 * 2 }.reduce(0, +)
           }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progressDownload < 100 {
                progressDownload += 6
            } else {
                isLoadingComplete = true
                timer?.invalidate()
            }
        }
    }
}

#Preview {
    DownloadLoadingProgresserView(progressDownload: .constant(0.25))
}



