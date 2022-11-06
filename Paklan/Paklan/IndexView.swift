//
//  IndexView.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI

struct IndexView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem(){
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                    Text("Home")
                }
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
