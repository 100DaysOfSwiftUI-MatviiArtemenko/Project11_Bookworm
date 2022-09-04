//
//  RatingView.swift
//  Project11_Bookworm
//
//  Created by admin on 22.08.2022.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    @State private var offColor = Color.gray
    @State private var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        withAnimation {
                            //changeColor(for: number)
                            rating = number
                        }
                    }
                
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
//    func changeColor(for number: Int) {
//        switch number {
//        case 1 :
//            onColor = Color.pink
//        case 2 :
//            onColor = Color.orange
//        case 5 :
//            onColor = Color.yellow
//        default :
//            onColor = Color.green
//        }
//    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
