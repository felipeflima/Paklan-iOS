//
//  HomeView.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authEnvObj: AuthenticationController
    @State private var blurAmount: CGFloat = 0
    var body: some View {
        ZStack(alignment: .top){
            Color.init(0x242424).ignoresSafeArea()
            HStack{
                Image("paklanlogo light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .padding(.leading)
                Spacer()
            }
            VStack{
                HStack{
                    Text("$1000")
                        .foregroundColor(.white)
                        .font(.custom(
                            "Futura",
                            fixedSize: 36))
                        .padding(.trailing)
                        .blur(radius: blurAmount)
                    Button(action: {
                        if (blurAmount == 0){
                            self.blurAmount = 10
                        }
                        else{
                            self.blurAmount = 0
                        }
                    },label: {
                       Image(systemName: "eye.fill")
                    })
                }.offset(y:130) .padding(.bottom, 150)
                ZStack{
                    Rectangle()
                        .fill(Color.init(0x2e2e2e))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(70).ignoresSafeArea()
                    VStack{
                        Text("Recent Transactions")
                            .foregroundColor(.white)
                            .font(.custom(
                                    "Futura",
                                    fixedSize: 25))
                            .padding(.top)
                        Spacer()
                    }
                    VStack{
                        ZStack{
                            Rectangle()
                                .fill(Color.init(0x242424))
                                .frame(maxWidth: 400, maxHeight: 100)
                                .cornerRadius(30)
                            Text("Sent $100.00 to Felipe")
                                .foregroundColor(.white)
                                .font(.custom(
                                        "Futura",
                                        fixedSize: 25))
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color.init(0x242424))
                                .frame(maxWidth: 400, maxHeight: 100)
                                .cornerRadius(30)
                            Text("Sent $200.00 to Juliana")
                                .foregroundColor(.white)
                                .font(.custom(
                                        "Futura",
                                        fixedSize: 25))
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color.init(0x242424))
                                .frame(maxWidth: 400, maxHeight: 100)
                                .cornerRadius(30)
                            Text("Received $50.00 from Lupi")
                                .foregroundColor(.white)
                                .font(.custom(
                                        "Futura",
                                        fixedSize: 25))
                        }
                        ZStack{
                            Rectangle()
                                .fill(Color.init(0x242424))
                                .frame(maxWidth: 400, maxHeight: 100)
                                .cornerRadius(30)
                            Text("Won the lottery")
                                .foregroundColor(.white)
                                .font(.custom(
                                        "Futura",
                                        fixedSize: 25))
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
