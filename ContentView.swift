//
//  ContentView.swift
//  list
//
//  Created by 잇쬬 on 5/4/25.
//

import SwiftUI

struct ListItem: Identifiable, Equatable {
    let id = UUID()
    var text: String
    var isChecked: Bool = false
}

struct ContentView: View {
    @State private var Lst: [ListItem] = []
    @State private var apnd: String = ""
    var body: some View {
        VStack {
            List {
                ForEach(Lst) { item in
                    HStack {
                        Button(action: {
                            if let index = Lst.firstIndex(of: item) {
                                Lst[index].isChecked.toggle()
                            }
                        }) {
                            Image(systemName: item.isChecked ? "checkmark.circle.fill" : "circle")
                        }
                        Text(item.text)
                        Spacer()
                        Button {
                            if let index = Lst.firstIndex(of: item) {
                                Lst.remove(at: index)
                            }
                        } label: {
                             Image(systemName: "trash")
                                .foregroundColor(.gray)
                        }
                    }.buttonStyle(BorderlessButtonStyle())
                }
                
            }
            HStack {
                TextField("항목 추가", text: $apnd)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button {
                    if !apnd.isEmpty {
                        Lst.append(ListItem(text: apnd))
                        apnd = ""
                    }
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .padding(.trailing)
    }
}

#Preview {
    ContentView()
}
