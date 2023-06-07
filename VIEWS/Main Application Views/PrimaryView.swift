//
//  PrimaryView.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

struct PrimaryView: View {
    
    @EnvironmentObject var viewModel : LocalUserViewModel
//    @ObservedObject var InterruptorModel : NotificationManager

    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    ZStack{
                        
                        SocialProgressView(socialProgress: viewModel.socialProgress)
                            .frame(width: 125, height: 125)
                        Text("\(viewModel.socialProgress * 100, specifier: "%.0f")")
                            .font(.largeTitle)
                            .bold()
                    }.frame(width: 125, height: 125)
                        .offset(x: -25)
                    ZStack{
                        
                        RecreateProgressView(recreateProgress: viewModel.recreateProgress)
                            .frame(width: 125, height: 125)
                        Text("\(viewModel.recreateProgress * 100, specifier: "%.0f")")
                            .font(.largeTitle)
                            .bold()
                    }.frame(width: 125, height: 125)
                        .offset(x: 25)
                }
                // Here's what needs to happen with this text: on first view tell the user that when their first notification comes there will be a prompt here to do something.
                // if firstRun = true -> string
                // any other time there will be the prompt for an action:
                // if the user does the activity it gets a score +1
                // if no activities have a score the user gets a random activity from userActivities
                // the array can be sorted by score to return the most popular activities for the user
                
                    
//                Text("\(viewModel.randomActivity.self.name )")
                Text("Here is where we'll tell you what to do!")
                        .font(.system(size: 50))
                        .frame(width: 300)
                        .padding(50)
                
                
                Button("Give me something else.") {
                    viewModel.refresh()
                }
                .buttonStyle(.borderedProminent)
                .tint(.teal)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .font(.title2)
                .padding()
                
                Button("I DID IT!!!") {
                    viewModel.iDidIt()
                    viewModel.clearBadge()
                }
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 50, alignment: .center)
                .font(.title2)
                .foregroundColor(.white)
                .background(Color.orange)
                .containerShape(RoundedRectangle(cornerRadius: 10))
                .font(.title)
                .padding()
                
                Button("Print") {
                    print("\(viewModel.localUserTimeLine)")
                    print("First Launch is: \(viewModel.firstLaunchOfApp)")
                    print("User preferences: Outside = \(viewModel.outside), Inside = \(viewModel.inside), High Energy = \(viewModel.highEnergy), Low Energy = \(viewModel.lowEnergy), Relaxing = \(viewModel.relaxing), Stimulating = \(viewModel.stimulating)")
                    print("\(viewModel.userActivities)")
                }

                Button("Reset") {
                    viewModel.socialProgress = 1.0
                    viewModel.recreateProgress = 0.0
                }
                
                Button("Random Activity") {
                    viewModel.generateRandomActivity()
                }
                
                NavigationLink("User Preferences", destination: UserPreferencesView())
            }
        }
    }
}

struct PrimaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryView()
            .environmentObject(LocalUserViewModel())
    }
}
