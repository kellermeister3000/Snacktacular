//
//  StartSelectionView.swift
//  Snacktacular
//
//  Created by Philip Keller on 2/24/23.
//

import SwiftUI

struct StartSelectionView: View {
    @State var rating: Int // change this to @Binding after layout is tested
    let highestRating = 5
    let unselected = Image(systemName: "star")
    let selected = Image(systemName: "star.fill")
    let font: Font = .largeTitle
    let fillColor: Color = .red
    let emptyColor: Color = .gray
    
    var body: some View {
        HStack {
            ForEach(1...highestRating, id: \.self) { number in
                showStar(for: number)
                    .foregroundColor(number <= rating ? fillColor : emptyColor)
                    .onTapGesture {
                        rating = number
                    }
            }
            .font(font)
        }
    }
    
    func showStar( for number: Int) -> Image {
        if number > rating {
            return unselected
        } else {
            return selected
        }
    }
}

struct StartSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        StartSelectionView(rating: 4)
    }
}
