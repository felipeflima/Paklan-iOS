//
//  AccountView.swift
//  Paklan
//
//  Created by Felipe Lima on 12/9/22.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    var body: some View {
        ZStack{
            Color.init(0x242424).ignoresSafeArea()
            VStack(spacing: 50){
        
                Image("paklanlogo light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                
                
                Text("USER: " + Authentication.userEmail) .foregroundColor(.white)
                
                
                Button(action: {
                    authEnvObj.signOut()
                },label: {
                    Text("Sign Out")
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.purple)
                        .cornerRadius(10)
                })
//                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
