//
//  InitiialInterruptionTime.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI


struct TimeAndSnark: View {
    
    @EnvironmentObject var viewModel : LocalUserViewModel
    @StateObject var InterruptorModel = NotificationManager()
    @State private var setInterruptor : Date = Date()

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = .autoupdatingCurrent
        formatter.timeStyle = .short
        formatter.timeZone = .autoupdatingCurrent
        return formatter
    }()
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Set a time for a friendly reminder to ditch mindless scrolling and embrace productive tasks!")
                    .padding()
                    .font(.title)
                Text("(Choose at least one time.)")
//                    .padding()
                
                DatePicker("Choose at least one time:", selection: $setInterruptor, displayedComponents: .hourAndMinute)
                    .padding()
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                
//                Text("\(setInterruptor, formatter: dateFormatter)")
                Button("Set Time") {
                    NotificationManager.instance.requestAuthorization(date: setInterruptor)
                    NotificationManager.instance.scheduleNotification(date: setInterruptor)
                    viewModel.localUserTimeLine.append(setInterruptor)
                    // the next print lines can be deleted before finishing
                    print("\(Date())")
                    print("\(setInterruptor.formatted())")
                    print("The time line is: \(viewModel.localUserTimeLine)")
                    print("First Launch is: \(viewModel.firstLaunchOfApp)")
                    print("User preferences: Outside = \(viewModel.outside), Inside = \(viewModel.inside), High Energy = \(viewModel.highEnergy), Low Energy = \(viewModel.lowEnergy), Relaxing = \(viewModel.relaxing), Stimulating = \(viewModel.stimulating)")
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .font(.title)
                .padding()
             
//                Button("Continue") {
//                    viewModel.firstLaunchOfApp.toggle()
//                    viewModel.save()
//                }
//                .fixedSize(horizontal: false, vertical: true)
//                .multilineTextAlignment(.center)
//                .frame(width: 300, height: 50, alignment: .center)
//                .font(.title2)
//                .foregroundColor(.white)
//                .background(Color.orange)
//                .containerShape(RoundedRectangle(cornerRadius: 10))
//        }
//        .contentShape(RoundedRectangle(cornerRadius: 10))
                
                NavigationLink("Continue", destination: PrimaryView( InterruptorModel: NotificationManager()))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 50, alignment: .center)
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .containerShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .simultaneousGesture(TapGesture().onEnded{
                        viewModel.firstLaunchOfApp.toggle()
                        viewModel.save()
                    })
                    .padding()
                    
            }
        }
    }
}

struct TimeAndSnark_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndSnark(InterruptorModel: NotificationManager())
    }
}
