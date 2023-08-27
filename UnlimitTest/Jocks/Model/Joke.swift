//
//  Joke.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation

struct Joke: Codable, Hashable {
    let text: String
    var date = Date()
}
