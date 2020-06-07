//
//  ContentView.swift
//  HashtagGenerator
//
//  Created by David Para on 6/7/20.
//  Copyright © 2020 David Para. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tag = ""
    @State var hashtag = HashtagGenerator(hashtag: "")
    
    var body: some View {
        let tagBinding = Binding<String>(
            get: { self.tag },
            set: {
                self.tag = $0
                self.hashtag.hashtag = $0
        })
        
        return VStack {
            TextField("Enter keyword", text: tagBinding)
            Text("\(hashtag.hashtag)")
        }
    }
}

@propertyWrapper
struct Hashtag {
    private(set) var value = ""
    
    var wrappedValue: String {
        get { return value }
        set {
            let tagValue = newValue.capitalized
                .replacingOccurrences(of: " ", with: "")
            value = newValue == "" ? "" : "#\(tagValue)"
        }
    }
}

struct HashtagGenerator {
    @Hashtag var hashtag: String
    
    init(hashtag: String) {
        self.hashtag = hashtag
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
