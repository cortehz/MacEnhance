//
//  ClipboardWindowView.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 16.06.24.
//

import SwiftUI

struct ClipboardWindowView: View {
    @StateObject private var viewModel = ClipboardViewModel()

    var body: some View {
        VStack {
            List(viewModel.clipboardHistory) { item in
                HStack {
                    Text(item.content)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    Spacer()
                    Button(action: {
                        viewModel.copyToClipboard(item)
                        NSApp.keyWindow?.close() // Close the window after copying
                    }) {
                        Image(systemName: "doc.on.clipboard")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
                .padding(.vertical, 4)
            }
            .frame(width: 300, height: 400)
        }
        .padding()
    }
}

struct ClipboardWindowView_Previews: PreviewProvider {
    static var previews: some View {
        ClipboardWindowView()
    }
}
