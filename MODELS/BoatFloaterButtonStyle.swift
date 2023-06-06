//
//  BoatFloaterButtonStyle.swift
//  recreate
//
//  Created by Kevin Buchholz on 6/2/23.
//

import SwiftUI

//struct BoatFloaterButtonStyle: ToggleStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        return ZStack{
//                configuration.label
//                .font(.title2)
//                .padding()
//                .frame(width: 300, height: 50, alignment: .center)
//                .foregroundColor(.white)
//                .background(configuration.isOn ? .orange : .teal)
//                .fixedSize(horizontal: false, vertical: true)
//                .multilineTextAlignment(.center)
//                .containerShape(RoundedRectangle(cornerRadius: 10))
//                .onTapGesture {
//                    configuration.isOn.toggle()
//                }
//        }
//      }
//}
//
//
//
//
//struct BigButtonStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        Button("Outside", action: { })
//            .toggleStyle(BoatFloaterButtonStyle())
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
