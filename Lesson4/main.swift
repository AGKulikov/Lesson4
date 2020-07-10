//
//  main.swift
//  Lesson4
//
//  Created by Feniks on 10.07.2020.
//  Copyright © 2020 Feniks. All rights reserved.
//


class Car {
    let model: String
    let year: Int
    let length: Int
    let numberOfDoors: Int
    var runningEngine: Bool
    var windowsOpen: Int //процент открытия окна
    
    init(model: String, year: Int, length: Int, numberOfDoors: Int, runningEngine: Bool, windowsOpen: Int) {
        self.model = model
        self.year = year
        self.length = length
        self.numberOfDoors = numberOfDoors
        self.runningEngine = runningEngine
        self.windowsOpen = windowsOpen
    }
    
    func launch (an action: ActionsWithCar) {
        switch action {
        case .closeWindow:
            windowsOpen = 0
        case .openWindow:
            windowsOpen = 100
        case .openWindow50:
            windowsOpen = 50
        case .startCar:
            runningEngine = true
            windowsOpen = 10
        case .stopCar:
            runningEngine = false
            windowsOpen = 0
        case .loadCargo50:
            break
        case .loadCargo100:
            break
        case .unloadCargo50:
            break
        case .unloadCargo100:
            break
        case .sportsMode:
            break
        }
    }
}

class SportCar: Car {
    var turbineIsActive: Bool
    
    init(model: String, year: Int, length: Int, numberOfDoors: Int, runningEngine: Bool, windowsOpen: Int, turbineIsActive: Bool) {
        self.turbineIsActive = turbineIsActive
        
        super.init(model: model, year: year, length: length, numberOfDoors: numberOfDoors, runningEngine: runningEngine, windowsOpen: windowsOpen)
    }
    override func launch (an action: ActionsWithCar) {
        switch action {
        case .closeWindow:
            windowsOpen = 0
        case .openWindow:
            windowsOpen = 100
        case .openWindow50:
            windowsOpen = 50
        case .startCar:
            runningEngine = true
            windowsOpen = 10
        case .stopCar:
            runningEngine = false
            windowsOpen = 0
        case .loadCargo100:
            break
        case .loadCargo50:
            break
        case .unloadCargo50:
            break
        case .unloadCargo100:
            break
        case .sportsMode:
            turbineIsActive = true
        }
    }
}

class TrunkCar: Car {
    let bodyVolume: Int
    var grossBodyVolume: Int
    
    init(model: String, year: Int, length: Int, numberOfDoors: Int, runningEngine: Bool, windowsOpen: Int, bodyVolume: Int, grossBodyVolume: Int) {
        self.bodyVolume = bodyVolume
        self.grossBodyVolume = grossBodyVolume
        
        super.init(model: model, year: year, length: length, numberOfDoors: numberOfDoors, runningEngine: runningEngine, windowsOpen: windowsOpen)
    }
    
    override func launch (an action: ActionsWithCar) {
        switch action {
        case .closeWindow:
            windowsOpen = 0
        case .openWindow:
            windowsOpen = 100
        case .openWindow50:
            windowsOpen = 50
        case .startCar:
            runningEngine = true
            windowsOpen = 10
        case .stopCar:
            runningEngine = false
            windowsOpen = 0
        case .loadCargo100:
            grossBodyVolume = bodyVolume
        case .loadCargo50:
            grossBodyVolume = bodyVolume/2
        case .unloadCargo50:
            grossBodyVolume = grossBodyVolume/2
        case .unloadCargo100:
            grossBodyVolume = 0
        case .sportsMode:
            break
        }
    }
}

enum ActionsWithCar {
    case startCar, stopCar, openWindow, openWindow50, closeWindow, loadCargo50, loadCargo100, unloadCargo50, unloadCargo100, sportsMode
}

var car1Trunk = TrunkCar (model: "MAN", year: 2005, length: 12, numberOfDoors: 4, runningEngine: true, windowsOpen: 0, bodyVolume: 12000, grossBodyVolume: 0)

var car2Sport = SportCar (model: "Jaguar", year: 2019, length: 4, numberOfDoors: 2, runningEngine: true, windowsOpen: 50, turbineIsActive: false)

car1Trunk.launch(an: .loadCargo50)
car2Sport.launch(an: .sportsMode)

print(car1Trunk.grossBodyVolume)
print(car2Sport.turbineIsActive)

