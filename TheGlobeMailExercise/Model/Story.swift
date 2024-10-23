//
//  Story.swift
//  TheGlobeMailExercise
//
//  Created by Darshan Vyas on 2024-10-22.
//

import Foundation

struct RecommendationsResponse: Codable {
    let recommendations: [Story]
    
    enum CodingKeys: String, CodingKey {
        case recommendations
    }
}

struct Story: Codable, Identifiable {
    let id = UUID()
    let title: String
    let byline: [String]
    let protectionProduct : String?
    let promoImage: PromoImage
    
    enum CodingKeys : String, CodingKey  {
        case title
        case byline
        case protectionProduct = "protection_product"
        case promoImage = "promo_image"
    }
}


struct PromoImage: Codable {
    let urls: ImageUrls
    
    struct ImageUrls: Codable {
        let small: String
        
        enum CodingKeys: String, CodingKey {
            case small = "650"
        }
    }
}


struct MockData {
    static let sampleStory  = Story(
        title: "CBC chief Catherine Tait resists calls to reject exit cash, including bonuses",
        byline: ["Marie Woolf", "Justin Robertson"],
        protectionProduct: "red",
        promoImage: PromoImage(urls: PromoImage.ImageUrls(small: "https://www.theglobeandmail.com/resizer/v2/UTQIXSIFO5EFRDKCKA7QUHBECU.JPG?auth=c7448fdc5327a6e2a2b1837bba3d91f1948b5539e0ca5387d62bf85871002145&width=650&quality=80"))
    )
       static let story       = [sampleStory, sampleStory, sampleStory, sampleStory]
    
}


