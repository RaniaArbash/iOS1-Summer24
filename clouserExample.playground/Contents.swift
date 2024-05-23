




var a: Int = 9


func addTwoNumbers(n1: Int, n2: Int) -> Int{
    
    return n1 + n2
    
}


var myFirstFuncVariable = {(n1: Int, n2: Int)-> Int in
        return n1 + n2
}
myFirstFuncVariable(22, 33)

// higher order function
func doMath(n1: Int, n2: Int, op: (Int,Int)->Int ){
    op(n1,n2)
    
}

doMath(n1: 22, n2: 88, op: myFirstFuncVariable)

doMath(n1: 44, n2: 10) { n1, n2 in
    return n1 - n2
}




var array : [Int] = [22,33,11,10,3,5,7,9]

// 1- give the max
// 2- give the min
// 3- give me the ave

func myFunction (intArray: [Int], theLogic: ([Int])->Int)->Int{
    return theLogic(intArray)
}


// 1- give the max
print( myFunction(intArray: array) { a in
    var max = a[0]
    for number in a {
        if number > max {
            max = number
        }
    }
    return max
})
// 2- give the min
print( myFunction(intArray: array) { a in
    var min = a[0]
    for number in a {
        if number < min {
            min = number
        }
    }
    return min
})

// 2- give the ave
print( myFunction(intArray: array) { a in
    var total =  0
    for number in a {
        total += number
    }
    return Int(total/(a.count))
})



