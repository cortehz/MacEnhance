import SwiftUI


struct ToolCard: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
        .frame(width: 150, height: 150)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct ToolSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ToolSelectionView()
    }
}
