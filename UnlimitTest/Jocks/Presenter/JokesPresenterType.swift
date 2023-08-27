//
//  JokesPresenterType.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation

protocol JocksPresenterType : AnyObject {
    var delegate : JocksPresenterViewDelegate? {get set}
    func loadJokes()
    func startJokeFetcher()
    func stopJokeFetcher()
}

protocol JocksPresenterViewDelegate: AnyObject {
    func updateJokes(jocks: [Joke])
}

protocol JocksPresenterDependencyType: AnyObject {
    var jokesService: JokesServiceType {get}
    var timerService: TimerServiceType {get}
    var storageService: StorageServiceType {get}
}

class JocksPresenterDependency: JocksPresenterDependencyType {
    
    private let _jokesService = JokesService()
    private let _timerService = TimerService()
    private let _storageService = StorageService()

    var jokesService: JokesServiceType {
        _jokesService
    }
    
    var timerService: TimerServiceType {
        _timerService
    }
    
    var storageService: StorageServiceType {
        _storageService
    }

    init(){}
}
