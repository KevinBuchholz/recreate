//
//  UserActivities.swift
//  recreate
//
//  Created by Kevin Buchholz on 6/4/23.
//

import SwiftUI

struct UserActivities: View {
    @EnvironmentObject var viewModel : LocalUserViewModel
    
//    var activities : viewModel.userActivities
    var userActivities : [Activity]

    var body: some View {
        List(viewModel.userActivities) {
            activity in
            Text(activity.name)
        }
        Button("Print Assigned User Activities") {
            print("\(viewModel.assignedUserActivities)")
        }
    }
}

struct UserActivities_Previews: PreviewProvider {
    static var previews: some View {    
        UserActivities(userActivities: [])
            .environmentObject(LocalUserViewModel())
    }
}
