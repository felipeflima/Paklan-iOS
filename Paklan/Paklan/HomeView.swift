//
//  HomeView.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    var body: some View {
        ZStack{
            Color.init(0x242424).ignoresSafeArea()
            VStack{
                Text("You are singed in")
                Button(action: {
                    authEnvObj.signOut()
                },label: {
                    Text("Sign Out")
                        .foregroundColor(Color.blue)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .padding()
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
