//
//  PrimaryView.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

struct PrimaryView: View {
    
    @EnvironmentObject var viewModel : LocalUserViewModel

    @State var primaryViewActivityName = "This is where we'll tell you what to do!"
    @State var primaryViewActivityPrompt = ""
    
    func giveMeTheRightText() {
        for userActivity in viewModel.assignedUserActivities {
            if Date.now > userActivity.date  {
                primaryViewActivityName = userActivity.name
                primaryViewActivityPrompt = userActivity.prompt
            } else {
                primaryViewActivityName = "This is where we'll tell you what to do!"
                primaryViewActivityPrompt = ""
            }
        }
    }

    var body: some View {
        NavigationStack{
            VStack{
                Spacer(minLength: 50)
                Group {
                    HStack{
                        ZStack{
                            
                            SocialProgressView(socialProgress: viewModel.socialProgress)
                                .frame(width: 150, height: 150)
                            VStack {
                                Text("\(viewModel.socialProgress * 100, specifier: "%.0f") %")
                                    .font(.largeTitle)
                                    .bold()
                                Text("Social Media")
                            }
                        }
                        .frame(width: 125, height: 125)
                        .offset(x: -25)
                        ZStack{
                            
                            RecreateProgressView(recreateProgress: viewModel.recreateProgress)
                                .frame(width: 150, height: 150)
                            VStack{
                                Text("\(viewModel.recreateProgress * 100, specifier: "%.0f") %")
                                    .font(.largeTitle)
                                    .bold()
                                Text("Recreate")
                            }
                        }.frame(width: 125, height: 125)
                            .offset(x: 25)
                    }
                    .padding(100)
                    
                }
                .offset(y: -100)
                // Here's what needs to happen with this text: on first view tell the user that when their first notification comes there will be a prompt here to do something.
                // if firstRun = true -> string
                // any other time there will be the prompt for an action:
                // if the user does the activity it gets a score +1
                // if no activities have a score the user gets a random activity from userActivities
                // the array can be sorted by score to return the most popular activities for the user
                
        
        Group {
                    Text("\(primaryViewActivityName)")
                        .font(.system(size: 50))
                        .frame(width: 300)
//                        .padding(16)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .top
                            )
                            .fixedSize(horizontal: false, vertical: true)
                    
                    Text("\(primaryViewActivityPrompt)")
                        .font(.largeTitle)
                        .frame(width: 300)
//                        .padding(16)
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .top
                            )
                            .fixedSize(horizontal: false, vertical: true)
        }
        
        .offset(y: -100)
                Group{
                    // Doesn't do anything yet.
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
                    
                    
                }
                .offset(y: -50)

//                NavigationLink("User Preferences", destination: UserPreferencesView())
            }
        }
        .onAppear {
            //Load [assignedUserActivites] from disk
            if case viewModel.assignedUserActivities = viewModel.loadArrayFromStorage() {
                giveMeTheRightText()
            } else {
                print("Failed to load array.")
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
