//
//  SpotDetailPhotoScrollView.swift
//  Snacktacular
//
//  Created by Philip Keller on 2/28/23.
//

import SwiftUI

struct SpotDetailPhotoScrollView: View {
//    struct FakePhoto: Identifiable {
//        let id = UUID().uuidString
//        var imageURLString = "https://firebasestorage.googleapis.com:443/v0/b/snacktacular-abb77.appspot.com/o/g3tY09sN1rGsalhHaHnJ%2F0937A6E3-B089-46EF-B96F-E69FEE84086E.jpeg?alt=media&token=204f9057-1265-4de3-975b-3ec644cc8175"
//    }
//
//    let photos = [FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto(), FakePhoto()]
    
    @State private var showPhotoViewerView = false
    @State private var uiImage = UIImage()
    @State private var selectedPhoto = Photo()
    var photos: [Photo]
    var spot: Spot
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 4) {
                ForEach(photos) { photo in
                    let imageURL = URL(string: photo.imageURLString) ?? URL(string: "")
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .onTapGesture {
                                let renderer = ImageRenderer(content: image)
                                selectedPhoto = photo
                                uiImage = renderer.uiImage ?? UIImage()
                                showPhotoViewerView.toggle()
                            }
                        
                    } placeholder: {
                        ProgressView()
                            .frame(width: 80, height: 80)
                    }

                }
            }
        }
        .frame(height: 80)
        .padding(.horizontal, 4)
        .sheet(isPresented: $showPhotoViewerView) {
            PhotoView(photo: $selectedPhoto, uiImage: uiImage, spot: spot)
        }
    }
}

struct SpotDetailPhotoScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SpotDetailPhotoScrollView(photos: [Photo(imageURLString: "https://firebasestorage.googleapis.com:443/v0/b/snacktacular-abb77.appspot.com/o/g3tY09sN1rGsalhHaHnJ%2F0937A6E3-B089-46EF-B96F-E69FEE84086E.jpeg?alt=media&token=204f9057-1265-4de3-975b-3ec644cc8175")], spot: Spot(id: "g3tY09sN1rGsalhHaHnJ"))
    }
}
