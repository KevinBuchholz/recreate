//
//  UserDefiner.swift
//  recreate
//
//  Created by Kevin Buchholz on 5/19/23.
//

import SwiftUI

struct UserDefiner: View {
    @EnvironmentObject var viewModel : LocalUserViewModel

    
    var body: some View {
        NavigationStack {
            VStack {
                Group{
                    Text("Let the fun begin!")
                        .font(.title)
                    Text("Tell us what floats your boat!")
                        .font(.title)
                    Text("(Pick at least one from each category.)")
                }

                VStack{
                    Text("Environment")
                        .font(.subheadline)
                    
                    Button(action: {
                        viewModel.outside.toggle()
                    }) {
                        Text("Outside")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.outside ? Color.orange : Color.teal) // Conditional background color
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10)) // Make the whole button tappable
                    
                    Button(action: {
                        viewModel.inside.toggle()
                    }) {
                        Text("Inside")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.inside ? Color.orange : Color.teal)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text("Energy")
                        .font(.subheadline)
                    
                    Button(action: {
                        viewModel.highEnergy.toggle()
                    }) {
                        Text("High Energy")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.highEnergy ? Color.orange : Color.teal)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button(action: {
                        viewModel.lowEnergy.toggle()
                    }) {
                        Text("Low Energy")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.lowEnergy ? Color.orange : Color.teal)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                    Text("Stimulation")
                        .font(.subheadline)
                    
                    Button(action: {
                        viewModel.stimulating.toggle()
                    }) {
                        Text("Stimulating")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.stimulating ? Color.orange : Color.teal)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button(action: {
                        viewModel.relaxing.toggle()
                    }) {
                        Text("Relaxing")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: 50, alignment: .center)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(viewModel.relaxing ? Color.orange : Color.teal)
                            .containerShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                    NavigationLink("Continue", destination: TimeAndSnark())
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 50, alignment: .center)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .containerShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                        .simultaneousGesture(TapGesture().onEnded{
                            viewModel.userActivitiesSort()
                            DirectoryService.writeModelToDisk(viewModel.userActivities)
                            print("\(viewModel.userActivities)")
                        })
                        .padding()
                }
                .padding()
            }
        }
        .navigationBarTitle("Navigation Bar")
        .toolbar(.hidden)
    }
}

struct UserDefiner_Previews: PreviewProvider {
    static var previews: some View {
        UserDefiner()
            .environmentObject(LocalUserViewModel())
    }
}
