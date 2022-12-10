//
//  IndexView.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI



struct IndexView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.init(0xCDCDCD))
    }
    var body: some View {
        
        ZStack{
            TabView{
                HomeView()
                    .tabItem(){
                        Label("Home", systemImage: "house")
                    }
                SendView()
                    .tabItem(){
                        Label("Send", systemImage: "paperplane")
                    }
                AccountView()
                    .tabItem(){
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                        Text("Account")
                    }
                
            }.accentColor(.purple)
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
