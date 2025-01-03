//
//  Sidebar.swift
//  MacEnhance
//
//  Created by Samuel Enyi Omanchi on 15.06.24.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection: String?

    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 20) {
                SidebarCard(title: "Clippy", selection: $selection, tag: "Clippy")
                SidebarCard(title: "Another Tool", selection: $selection, tag: "AnotherTool")
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .navigationTitle("Tools")
    }
}

struct SidebarCard: View {
    let title: String
    @Binding var selection: String?
    let tag: String

    var body: some View {
        Button(action: {
            selection = tag
        }) {
            VStack {
                Text(title)
                    .foregroundColor(selection == tag ? .blue : .gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
            }
            .frame(width: 150, height: 150)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
        }
        .buttonStyle(PlainButtonStyle()) // To make the whole card clickable without additional button styling
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(selection: .constant("Clippy"))
    }
}
