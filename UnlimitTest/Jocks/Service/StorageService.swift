//
//  StorageService.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation

protocol StorageServiceType : AnyObject{
    func saveJokes(jokes:[Joke])
    func loadJokes() -> [Joke]
}


final class StorageService: StorageServiceType {
    private let userDefault = UserDefaults.standard
    
    init(){}
    
    func saveJokes(jokes: [Joke]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(jokes), forKey:"jokes")

    }
    
    func loadJokes() -> [Joke] {
        if let data = userDefault.value(forKey:"jokes") as? Data {
            let jokes = try? PropertyListDecoder().decode(Array<Joke>.self, from: data)
            return jokes ?? []
        }
        return []
    }

}
