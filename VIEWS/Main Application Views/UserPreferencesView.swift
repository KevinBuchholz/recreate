//
//  UserPreferencesView.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

struct UserPreferencesView: View {
    @EnvironmentObject var viewModel : LocalUserViewModel
    var activities = loadCSV(from: "Activities CSV")
    
    var body: some View {
        NavigationStack{
            VStack{
                List(activities) { activity in
                        Text(activity.name)
                    Text(activity.prompt)
                }
                
                NavigationLink("User Activities", destination: UserActivities(userActivities: []))
            }
        }
    }
}

struct UserPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        UserPreferencesView()
            .environmentObject(LocalUserViewModel())
    }
}
