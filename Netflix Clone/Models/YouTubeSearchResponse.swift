//
//  YouTubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Şükrü Özkoca on 2.11.2022.
//

import Foundation
 
struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
