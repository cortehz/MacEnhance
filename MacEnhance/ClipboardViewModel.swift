import SwiftUI
import Combine

class ClipboardViewModel: ObservableObject {
    @Published var clipboardHistory: [ClipboardItem] = []

    private var clipboardChangeCancellable: AnyCancellable?

    init() {
        loadClipboardHistory()
        clipboardChangeCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.checkClipboard()
            }
    }

    private func checkClipboard() {
        guard let content = NSPasteboard.general.string(forType: .string) else { return }
        
        if clipboardHistory.first?.content != content {
            let newItem = ClipboardItem(content: content, date: Date())
            clipboardHistory.insert(newItem, at: 0)
            saveClipboardHistory()
        }
    }

    private func saveClipboardHistory() {
        if let data = try? JSONEncoder().encode(clipboardHistory) {
            UserDefaults.standard.set(data, forKey: "ClipboardHistory")
        }
    }

    private func loadClipboardHistory() {
        if let data = UserDefaults.standard.data(forKey: "ClipboardHistory"),
           let history = try? JSONDecoder().decode([ClipboardItem].self, from: data) {
            clipboardHistory = history
        }
    }

    func copyToClipboard(_ item: ClipboardItem) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(item.content, forType: .string)
    }
}
