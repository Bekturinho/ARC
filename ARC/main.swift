////
////  main.swift
////  ARC
////
////  Created by fortune cookie on 3/6/24.
////
//
import Foundation
//
//class Person{
//    var name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//    deinit {
//        print("\(name) сьебался")
//    }
//}
//class Appartmenr: Person{
//    var unit: String
//
//    init(unit: String) {
//        self.unit = unit
//    }
//
//    
//    var ternant: Person?
//    deinit {
//        print("\(ternant) сьебался")
//    }
//    
//    
//}
//
//
//
//
//
//Я cоздал класс Person у которого есть данные name и опциональная переменная aprtment которая относиться к класса Apartment
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) ливнул") }
//}
//
////Далее я создал класс Apartment у которого есть данные unit и опциональная переменная tenant которая относиться к классу Person
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    var tenant: Person?
//    deinit { print("Apartment \(unit) ливнул") }
//}
//Тут создал переменные типа Person и Apartment

//var hum: Person?
//var home:Apartment?

//тут я заполнил данными эти переменные
 
//hum = Person(name: "Beka")
//home = Apartment(unit: "221")
//
////здесь я привязал эти переменные
//hum?.apartment = home
//home?.tenant = hum

//тут я хочу их очистить но deinit не работает тк это сильные ссылки
//
//hum = nil
//home = nil
//Program ended with exit code: 0

////но если я поменяю связывающие их переменные на слабый тип ссылки(weak) то deinit заработает
//
//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    // попробую добавить weak
//   var apartment: Apartment?
//    deinit { print("\(name) ливнул") }
//}
//
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    // или попробую добавить weak тут
//    weak var tenant: Person?
//    deinit { print("Apartment \(unit) ливнул") }
//}
//
//
//var hum: Person?
//var home:Apartment?
//
//hum = Person(name: "Beka")
//home = Apartment(unit: "221")
//hum?.apartment = home
//home?.tenant = hum
//hum = nil
//home = nil


//все заработает ,он заработает только если хотябы один из ссылок будет слабой

//попробуем эту же тему с unowned
/*различие в unowned от weak в том что :
1)unowned всегда не опционален в отличии от weak
 2)unowned всегда должна быть гарантия,к примеру с человеком у него может и не быть карты ,но и банка всегда будут клиенты
 */
class Person {
    let name: String
    init(name: String) { self.name = name }
    // попробую добавить weak
   var card: Bank?
    deinit {
        print("\(name) ливнул") }
}


class Bank {
    let cardNumber: String
    unowned let user: Person
    init(cardNumber: String, user: Person) {
        self.cardNumber = cardNumber
        self.user = user
    }

    deinit {
        print("\(cardNumber) ливнул")
    }
    
}

var hum: Person?
var bank: Bank?

hum = Person(name: "Beka")
bank = Bank(cardNumber: "3232323223", user: hum!)
hum?.card = bank
hum = nil
bank = nil

//как итог эти два способа помогают избежать утечку памяти
// это все что я понял

