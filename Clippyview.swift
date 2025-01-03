import SwiftUI



struct ClippyView: View {
    @StateObject private var viewModel = ClipboardViewModel()
    @State private var showDeleteConfirmation = false

    var body: some View {
        ZStack {
            // Background color
            Color.white.ignoresSafeArea()
        
        VStack {
            HStack(alignment: .bottom) {
                Text("History").foregroundStyle(.gray).padding(.leading, 4).padding(.leading, 16).fontWeight(.semibold).font(.title)
                
                Spacer()
                TextField("Search", text: $viewModel.searchQuery)
                    .textFieldStyle(PlainTextFieldStyle()) // Remove default styling
                    .frame(height: 40)
                    .padding(.horizontal, 12)
                    .background(
                        HStack {
                            Spacer()
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.trailing, 12)
                        }
                    )
                    .background(.gray.opacity(0.1)) // Background for the entire field
                    .cornerRadius(8)
                    .frame(maxWidth: 250)
                    .padding(.top, 12)
                    .padding(.leading, 20)
                
                // Then modify your button code:
                HStack {
                    Button(action: {
                           showDeleteConfirmation = true
                       }) {
                           // Move all the styling into the button's content view
                           Image(systemName: "trash")
                               .foregroundStyle(.white)
                               .frame(height: 40) // Move frame to contain the image
                               .padding(.horizontal, 12)
                               .background(Color(hex: 0xF99090))
                               .cornerRadius(8)
                       }
                       .buttonStyle(.plain)
                       .padding(.trailing, 16)
                       .padding(.top, 12)
                       .popover(isPresented: $showDeleteConfirmation) {
                        VStack(spacing: 16) {
                            Text("Clear Clipboard History")
                                .font(.headline)
                            
                            Text("Are you sure you want to clear all clipboard history?")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            HStack(spacing: 16) {
                                Button("Cancel") {
                                    showDeleteConfirmation = false
                                }
                                .buttonStyle(.bordered)
                                
                                Button("Delete All") {
                                    viewModel.clearHistory()
                                    showDeleteConfirmation = false
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.red)
                            }
                        }
                        .padding()
                        .frame(minWidth: 250)
                    }
                }
                .background(.white)
                
            }
            
            List(viewModel.filteredClipboardHistory) { item in
                HStack {
                    Text(item.content)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button(action: {
                        viewModel.copyToClipboard(item)
                    }) {
                        Image(systemName: "doc.on.clipboard")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    Button(action: {
                        viewModel.deleteItem(item)
                    }) {
                        Image(systemName: "minus.rectangle.fill").foregroundStyle(Color(hex: 0xF99090))
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            }
        }
        .navigationTitle("Clipboard History")
    }
}


struct ClippyView_Previews: PreviewProvider {
    static var previews: some View {
        ClippyView()
    }
}
