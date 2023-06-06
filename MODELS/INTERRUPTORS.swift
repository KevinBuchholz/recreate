//
//  NOTIFICATIONS.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//  THIS IS WHERE OUR NOTIFICATIONS WILL BE DEFINED

import Foundation

struct Interruptor {
   // static var sampleInterruptors : [Interruptor] = [Interruptor(Activity = activity(rideABike)), title: "Hey Lazybones, they say you never forget how to ride a bike...", subtitle: "But, I bet you could challenge that notion.", snarkFactor: SnarkFactor.medium)]
    
    var id = UUID()
    var activity = Activity.self           //Notification is tied to the activity prompt that it will open
    var title : String                //Title text of the Notification
    var subtitle : String             //Subtitle text of the Notification
//    var environment : Environment          //Environment identifier (see activities)
//    var energy : Energy               //Energy identifier (see activities)
//    var stimulation : Stimulation         //Mental stim identifier (see activites)
 //   var snarkFactor : SnarkFactor          //How snarky the messages are- (user variable)
    var niceInterruptor: String
    var meanInterruptor: String
}



//Dictionary - spreadsheet - csv-  look into making tables and using json or csv
