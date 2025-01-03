import SwiftUI

struct ContentView: View {
    @NSApplicationDelegateAdaptor(ClipboardAppDelegate.self) var appDelegate
    var body: some View {
        ClippyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}



#Preview {
    ContentView()
}
