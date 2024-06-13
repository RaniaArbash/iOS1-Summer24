import UIKit


var numbers = [3,4,6,99,100,2,5]
var names = ["mary","John", "Smith"]

var welcomeMsg = names.map  { name in
    return "Welcome \(name)"
}

var mnames =  names.filter { name in
    return name.contains("h")
}
print (mnames)
var moreThanTen = numbers.filter { number in
    return number > 10
}
print(moreThanTen)

//print (newNumbers)




var adding = { (a: Int, b: Int)->Int in
    return a + b
}

// higher order function
func doMath(a: Int, b: Int , op : (Int,Int)->Int ) -> Int{
    return op(a,b)
}

doMath(a: 33, b: 44, op: adding)
doMath(a: 33, b: 66) { a, b in
    return a - b
}

doMath(a: 22, b: 10) { a, b in
    a * b
}
