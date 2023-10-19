//
//  ContentView.swift
//  MimicryKick
//
//  Created by Сергей Прокопьев on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @Namespace private var animation

    var body: some View {
        ZStack() {
            if isTapped {
                ZStack {
                    Button { isTapped.toggle() } label: {
                        Text("\(Image(systemName: "arrowshape.backward.fill")) Back")
                            .fixedSize()
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 42, alignment: .leading)
                            .padding()
                            .matchedGeometryEffect(id: "text", in: animation)
                    }
                }
                .frame(width: 325, height: 370, alignment: .topLeading)
                .background(
                    Color.blue.cornerRadius(10)
                        .matchedGeometryEffect(id: "background", in: animation)
                )
            } else {
                Button { isTapped.toggle() } label: {
                    Text("Open")
                        .foregroundStyle(.white)
                        .fixedSize()
                        .matchedGeometryEffect(id: "text", in: animation)
                        .frame(width: 100, height: 42)
                        .background(
                            Color.blue.cornerRadius(10)
                                .matchedGeometryEffect(id: "background", in: animation)
                        )
                }
            }
        }
        .padding()
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: isTapped ? .center : .bottomTrailing)
        .animation(.spring(duration: 1), value: isTapped)
    }
}

#Preview {
    ContentView()
}
