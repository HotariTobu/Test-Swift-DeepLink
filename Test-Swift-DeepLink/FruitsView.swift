//
//  FruitsView.swift
//  Test-Swift-DeepLink
//
//  Created by HotariTobu on 2022/02/17.
//

import SwiftUI

struct FruitsView: View {
    
    @SceneStorage("Item") var fruits:String?
    
    let fruitsList = ["apple","banana","strawberry"]
    
    var body: some View{
        List{
            ForEach(self.fruitsList ,id:\.self){ fruits in
                NavigationLink(
                    destination: Text(fruits),
                    tag: fruits,
                    selection: self.$fruits,
                    label: {Text(fruits)})
            }
        }.navigationTitle("Fruits")
    }
}

struct FruitsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitsView()
    }
}
