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
                HStack{
                    Image("paklanlogo light")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                    Button(action: {
                        authEnvObj.signOut()
                    },label: {
                        Text("Sign Out")
                            .foregroundColor(Color.white)
                            .frame(width: 100, height: 50)
                            .background(Color.purple)
                            .cornerRadius(10)
//                            .position(x:200, y:15)
                    })
                } //.position(x:100, y:10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
