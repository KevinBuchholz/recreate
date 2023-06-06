//
//  InitialView.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Circle()
                        .offset(y: -25)
                        .fill(.orange)
                    Group{
                        Text("RE").foregroundColor(.teal) + Text("CREATE").foregroundColor(.orange)
                    }
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                }
                    .offset(x: -75, y: -75)
                
                    Group {Text("STOP").foregroundColor(.teal).fontWeight(.bold) + Text(" the ") + Text("mindless").foregroundColor(.orange) + Text(" scroll and embrace the ") + Text("power ").foregroundColor(.teal) + Text("of ") + Text(" productive tasks!").foregroundColor(.orange)}
                        .font(.system(size: 40))
                            .multilineTextAlignment(.center)
                            .padding()
                            .offset(y: -75)
                
                ZStack {
                    Circle()
                        .offset(x: 100, y: 50)
                        .fill(.teal)
                    
                    NavigationLink(destination: UserDefiner()) {
                        Text("Get Started")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                            .font(.title)
                            .padding()
                    }
                    .background(
                        Button(action: {}) {
                            Color.clear
                        }
                    )
                    
                }
            }
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

