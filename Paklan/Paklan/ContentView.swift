//
//  ContentView.swift
//  Paklan
//
//  Created by Felipe Lima on 11/6/22.
//

import SwiftUI
import FirebaseAuth
let Pgray = Color(0x242424)

class AppViewModel: ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
        
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password){ [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                VStack{
                    Text("You are singed in")
                    Button(action: {
                        viewModel.signOut()
                    },label: {
                        Text("Sign Out")
                            .foregroundColor(Color.blue)
                            .frame(width: 200, height: 50)
                            .background(Color.green)
                            .padding()
                    })
                }
            }
            else{
                SignInView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack{
            Color.init(0x242424).ignoresSafeArea()
            VStack{
                Image("paklanlogo light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(y: -100)
                
                VStack{
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
//                        .offset(y: -10)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    Button {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signIn(email: email, password: password)
                    } label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(10)
                            .background(Color.purple)
                    }
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                    
                }
                .padding()
                //                    Spacer()
            }
        }
        //            .navigationTitle("Sign In")
        
    }
}


struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ZStack{
            Color.init(0x242424).ignoresSafeArea()
            VStack{
                Image("paklanlogo light")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(y: -100)
                
                VStack{
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
//                        .offset(y: -10)
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.none)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    Button {
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.signUp(email: email, password: password)
                    } label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(10)
                            .background(Color.purple)
                    }
                    
                }
                .padding()
                //                    Spacer()
            }
        }
        //            .navigationTitle("Sign In")
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppViewModel())
    }
}

extension Color {
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

