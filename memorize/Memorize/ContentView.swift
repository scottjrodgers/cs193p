//
//  ContentView.swift
//  Memorize
//
//  Created by Scott Rodgers on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐊", "🦨", "🍄", "🥮", "🍿"]
    // same to do Array<String> = ['X', 'A', ... ]

    var body: some View {
        // There's a Tuple View (within the curly braces)
        // VStack could take () and properties.
        // without the () the stuff after defaults to go to the content property
        // ViewBuilder takes a List of biew { view, view view} into a TupleView
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.orange)
        // the .padding() type of function is "view modifier".  They can be called on any
        // struct that behaves like a view.  They modify a view and returns a new view.
        // View modifiers can be chained together.
    }
}


struct CardView: View {
    let content: String
    
    // Only for temporary state
    @State var isFaceUp: Bool = true
    
    // There's a Tuple View (within the curly braces)
    // VStack could take () and properties.
    // without the () the stuff after defaults to go to the content property
    // ViewBuilder makes a List of views { view, view view} into a TupleView
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
                    .imageScale(.large)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


// Sets up the preview on the right.  Usually don't need to change
#Preview {
    ContentView()
}
