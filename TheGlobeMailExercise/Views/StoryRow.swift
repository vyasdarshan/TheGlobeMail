//
//  StoryRow.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import SwiftUI

struct StoryRow: View {
    let story: Story
        
    var body: some View {
        HStack {
            
            let title =  story.title
            
            VStack(alignment: .leading) {
                HStack{
                    
                    if (story.protectionProduct == "red") {
                        Text(title)
                            .font(.headline)
                        + Text(" X").foregroundStyle(.red)
                            
                            
                    } else {
                        Text(title)
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                            
                    }
                    
                    if let imageUrl = URL(string: story.promoImage.urls.small) {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                
                            
                        } placeholder: {
                            Color.gray
                                .frame(width: 100, height: 100)
                        }
                    }
                    
                }
                
                
                Text(formatAuthors(story.byline).uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        
    }
    
    
    
   
}

struct StoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let sampleStory = MockData.sampleStory
        StoryRow(story: sampleStory)
            .previewLayout(.sizeThatFits)
            
    }
}
