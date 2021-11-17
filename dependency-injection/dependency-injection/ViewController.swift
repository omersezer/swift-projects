//
//  ViewController.swift
//  dependency-injection
//
//  Created by omersezer on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

protocol IAnimal {
    func run() -> String
    func eat() -> String
    func stop() -> String
}


class Animal {
    var dog: IAnimal?
    
    init(dog: Dog) {
        self.dog = dog
    }
    
    func play() {
        dog?.run()
        dog?.stop()
        dog?.eat()
    }
}

class Dog: IAnimal {
    
    func run() -> String {
        <#code#>
    }
    
    func eat() -> String {
        <#code#>
    }
    
    func stop() -> String {
        <#code#>
    }
}

class Cat: IAnimal {
    func run() -> String {
        <#code#>
    }
    
    func eat() -> String {
        <#code#>
    }
    
    func stop() -> String {
        <#code#>
    }
}
