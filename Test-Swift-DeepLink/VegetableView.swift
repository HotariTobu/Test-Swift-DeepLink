//
//  VegetableView.swift
//  Test-Swift-DeepLink
//
//  Created by HotariTobu on 2022/02/17.
//

import SwiftUI

struct VegetableView: View {
    
    @SceneStorage("Item") var vegetable:String?
    
    let vegetableList = ["tomato","carrots","onion"]
    
    var body: some View{
        List{
            ForEach(self.vegetableList ,id:\.self){ vegetable in
                NavigationLink(
                    destination: Text(vegetable),
                    tag: vegetable,
                    selection: self.$vegetable,
                    label: {Text(vegetable)})
            }
        }.navigationTitle("Vegetable")
    }
}

struct VegetableView_Previews: PreviewProvider {
    static var previews: some View {
        VegetableView()
    }
}
