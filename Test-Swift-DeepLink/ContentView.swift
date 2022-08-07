//
//  ContentView.swift
//  Test-Swift-DeepLink
//
//  Created by HotariTobu on 2022/02/17.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var notificationModel:NotificationModel
    
    @SceneStorage("Genre") var genre:String?
    @SceneStorage("Item") var item:String?
        
    var body: some View {
        VStack {
            NavigationView{
                List{
                    NavigationLink(
                        destination: VegetableView(),
                        tag: "vegetable",
                        selection: self.$genre,
                        label: {Text("vegetable")})
                    NavigationLink(
                        destination: FruitsView(),
                        tag: "fruits",
                        selection: self.$genre,
                        label: {Text("fruits")})
                }.navigationTitle("Genre")
            }
            Button(action: {
                self.notificationModel.setNotification(genre: self.genre ?? "", item: self.item ?? "")
            }, label: {
                Text("Notification")
            })
        }
        .onOpenURL(perform: { url in
            let comp = URLComponents(url: url, resolvingAgainstBaseURL: true)
            
            self.genre = nil
            self.item = nil
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.genre = comp?.queryItems?.first?.value
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.item = comp?.queryItems?.last?.value
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
