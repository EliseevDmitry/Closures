//
//  main.swift
//  Closures
//
//  Created by Dmitriy Eliseev on 01.04.2025.
//

import Foundation


//--------------------------------------------------------------------/Задача 1

/*
 1. Заменить ??? на реализацию, чтобы a,b,c были равны 0,1,2
 
 func incrementer() -> ??? {
 //???
 }
 
 let inc1 = incrementer()
 let a = inc1() // 0
 let b = inc1() // 1
 let c = inc1() // 2
 
 print(a, b, c)
 */


/*
 func incrementer() -> (() -> Int) {
 var i = -1
 return {
 i += 1
 return i
 }
 }
 
 let inc1 = incrementer()
 let a = inc1()
 let b = inc1()
 let c = inc1()
 
 print(a, b, c)
 */

//--------------------------------------------------------------------/Задача 2

/*
 2. Написать функцию которая принимает число и
 на выходе возвращает сумму через функцию
 (функция которая возвращает функций)
 
 
 func add(_ n: Int) -> ((Int) -> Int) {
 }
 
 print(add(1)(3)) // -> 4
 print(add(0)(-15)) // -> -15
 print(add(100)(23)) // -> 123
 */

/*
 func add(_ n: Int) -> ((Int) -> Int) {
 {
 n + $0
 }
 }
 
 print(add(1)(3))
 print(add(0)(-15))
 print(add(100)(23))
 
 */


//--------------------------------------------------------------------/Задача 3

/*
 3. Написать функцию
 /*
  let plusTen = makePlusFunction(10)
  
  plusTen(0) -> 10
  plusTen(188) -> 198
  plusFive(plusTen(0)) -> 15
  */
 
 func makePlusFunction(_ baseNum: Int) -> (Int) -> Int {
 
 }
 */


/*
 func makePlusFunction(_ baseNum: Int) -> (Int) -> Int {
 {
 baseNum + $0
 }
 }
 
 let plusTen = makePlusFunction(10)
 
 print(plusTen(0))
 print(plusTen(188))
 let plusFive = makePlusFunction(5)
 print(plusFive(plusTen(0)))
 */


//--------------------------------------------------------------------/Задача 4

/*
 4. Разобрать пункты 1...5
 
 1. Что произойдет если я удалю здесь lazy ключевое слово?
 2. Что будет если добавить print в инициализатор?
 3. Почему возвращаемый тип внутри приращения закрытия является необязательным? (это escaping closure или non-escaping closure)
 4. Какой будет здесь тип данных? (()→())?
 5. Как запустить этот код?
 
 
 class SomeClass {
 var count: Int = 0
 
 lazy var increment = { [weak self] in
 return self?.count += 1
 }
 init() {
 increment()
 }
 }
 */

/*
 class SomeClass {
 var count: Int = 0
 
 lazy var increment = { [weak self] in
 return self?.count += 1
 }
 init() {
 increment()
 }
 }
 
 //1. Что произойдет если я удалю здесь lazy ключевое слово?
 //1. Self - еще не создан, будет ошибка компиляции
 
 
 //2. Что будет если добавить print в инициализатор?
 //ничего не напечатается, return добавлен как отвлечение от того что Замыкание ничего не возвращает () -> Void
 //я не сказал бы что - Optional(())!!!!
 
 //3. Почему возвращаемый тип внутри приращения закрытия является необязательным? (это escaping closure или non-escaping closure)
 //Замыкание инициализированное внутри ссылочного типа (Класса) - помоему всегда escaping, в нашем случае еще есть и слабая ссылка на [self]
 //нужен комментарий!!!!
 
 //4. Какой будет здесь тип данных? (()→())? будет тип - Void? (спросить?)
 
 //5. запуск кода ниже:
 
 
 let myClass = SomeClass()
 
 print(myClass)
 */

//--------------------------------------------------------------------/Задача 5


//5.
/*
func captureTest() {
    var lang = "Swift"
    let code = { [lang] in
        print(lang)
    }
    code()
    lang = "Golang"
    code()
}

print(captureTest()) //Swift - Swift
*/

//Почему выдал:
/*
 Swift
 Swift
 ()
 */

//--------------------------------------------------------------------/Задача 6


//6. Что принтанется?

/*
var x = 5
var y = 10
let printX: () -> Void = {
    print(x, y)
}
x = 10
y = 20

printX() //10,20
*/


//--------------------------------------------------------------------/Задача 7

//7. Что принтанется?

/*
class UIView {
    var tag = 0
}

var view = UIView()
view.tag = 1

let showTag = { [view] in
    print(view.tag)
}
showTag()

view = UIView()
view.tag = 2
showTag()

//1 далее 1 // тут лохонулся!!!! - но нужно разобрать

*/

//--------------------------------------------------------------------/Задача 8

/*
//8. Что принтанется?

var i = 0
var closureList = [()->()]()

for _ in 1...5 {
    closureList.append {
        print(i)
    }
    i += 1
}

closureList[0]()
closureList[1]()
closureList[2]()
closureList[3]()
closureList[4]()


//1-2-3-4-5 // тут лоханулся - но тут понятно

*/

//--------------------------------------------------------------------/Задача 9

//9.
/*
class Awesome {
    var text = "A"
}

var firstObj: Awesome? = Awesome()
var secondObj: Awesome? = firstObj

firstObj?.text = "B"

let closure = {
    firstObj?.text = "C"
}

firstObj = nil
closure()

print(firstObj?.text) //nil
print(secondObj?.text) //Optional("B") - тут внимательнее - хотя все понятно
*/

//--------------------------------------------------------------------/Задача 10

//10. Что принтанется?

struct StructA {
        var value: Int = 1
}

class ClassB {
        var internalStruct = StructA()
}

class ClassC {
        var value: Int = 2
}

struct StructD {
        var internalClass = ClassC()
}

let classB = ClassB() // v=1
let structD = StructD() //v=2

//ba = v1 dc = v2
let closure1 = { [ba = classB.internalStruct, dc = structD.internalClass] in
        return "\(ba.value) \(dc.value)"
}

let dc = structD.internalClass //v2

func function() -> String {
        return "\(classB.internalStruct.value) \(dc.value)" //v1v2
}

classB.internalStruct.value = 3
structD.internalClass.value = 4
//let closure1 = { [ba = classB.internalStruct, dc = structD.internalClass] in
//        return "\(ba.value) \(dc.value)"
//}
print(closure1() + " " + function())

//12 34 //неправильно указал 4!!! 1434
