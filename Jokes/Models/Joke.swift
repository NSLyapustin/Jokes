//
//  Joke.swift
//  Jokes
//
//  Created by Никита Ляпустин on 22.11.2021.
//

import Foundation

struct Joke: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Int
    let link: String
    let key: String
    let accessibility: Double
}
