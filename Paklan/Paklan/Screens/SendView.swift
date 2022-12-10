//
//  SendView.swift
//  Paklan
//
//  Created by Felipe Lima on 12/9/22.
//

import SwiftUI

struct SendView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    var body: some View {
        ZStack{
            Color.init(0x242424).ignoresSafeArea()
            VStack(spacing: 50){
        
                Image("paklanlogo light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                
                
                Text("Page under construction, sorry for the incovinience") .foregroundColor(.white)
            }
        }
    }

}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
