//
//  InitiialInterruptionTime.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI


struct TimeAndSnark: View {
    
    @EnvironmentObject var viewModel : LocalUserViewModel
    //@StateObject var InterruptorModel = NotificationManager()
    @State private var setInterruptor : Date = Date()
//    @State var hours : Int = 1

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
//                Text("How many hours do you typically spend on social media each day?")
//                    .padding()
//                    .font(.title3)
//                    .frame(width: 350)
//
//                Picker("Your age", selection: $hours) {
//                    ForEach(1...6, id: \.self) { number in
//                        Text("\(hours)")
//                    }
//                }
//                .padding()
//                .pickerStyle(.wheel)
                
                Text("Set a time for a reminder to ditch mindless scrolling and embraceproductive tasks!")
//                    .padding()
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                Text("(Choose at least one time.)")
//                    .padding()
                
                DatePicker("Choose at least one time:", selection: $setInterruptor, displayedComponents: .hourAndMinute)
//                    .padding()
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                
//                Text("\(setInterruptor, formatter: dateFormatter)")
                Button("Set Time") {
                    if viewModel.authorizedNotifications == false {
                        viewModel.requestAuthorization(date: setInterruptor)
                        viewModel.localUserTimeLine.append(setInterruptor)
                    }else {
                        Task {
                            do {
                                try await viewModel.scheduleCustomNotification(date: setInterruptor)
                                viewModel.localUserTimeLine.append(setInterruptor)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                .buttonBorderShape(.roundedRectangle(radius: 10))
                .font(.title)
                .padding()

                
                NavigationLink("Continue", destination: PrimaryView())
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
//                        viewModel.assignUserActivity()
//                        print("\(hours)")
                    })
                    .padding()
            }
        }
        .navigationBarTitle("")
        .toolbar(.hidden)
    }
}

struct TimeAndSnark_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndSnark()
            .environmentObject(LocalUserViewModel())
    }
}
