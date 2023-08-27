//
//  TimerService.swift
//  UnlimitTest
//
//  Created by Sachin Yadav on 26/08/23.
//

import Foundation


protocol TimerServiceType: AnyObject {
    func startTimer(interval: Int, callback: @escaping () -> Void)
    func stopTimer()
}

final class TimerService: TimerServiceType {
    
    private var timmer: Timer?
    
    init(){}
    
    func startTimer(interval: Int, callback: @escaping () -> Void) {
        timmer = Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: true, block: { _ in
            callback()
        })
    }
    
    func stopTimer() {
        timmer?.invalidate()
    }
    
}
