
class Shape {
    var name : String
    var size : Double
    
    init(name: String, size: Double) {
        self.name = name
        self.size = size
    }
    init(){
        self.name = ""
        self.size = 0
    }
    
    func printShape() {
        print("This shap is \(name) and its size is \(size)")
    }
}

class Rectangle : Shape { // Rectangle is a Shape
    var length: Int
    var width : Int
    
    init(name: String, size: Double, length: Int, width: Int) {
        self.length = length
        self.width = width
        super.init(name: name, size: size)
    }
    override init() {
        self.length = 0
        self.width = 0
        super.init()
    }
    override func printShape() {
        print("This Rectangle is \(name) and its size is \(size) and its length is \(length) and its width is \(width)")
    }
}

class Circle : Shape { // Circle is a Shape
    var radius: Int
    
    init(n: String, s: Double, r: Int){
        self.radius = r
        super.init(name: n, size: s)
    }
    override init() {
        self.radius = 0
        super.init()
    }
    override func printShape() {
        print("This Circle is \(name) and its size is \(size) and its radius is \(radius)")

    }
    
}

var circle : Shape = Shape(name: "Circle", size: 2.3)
circle.printShape()
var board : Rectangle = Rectangle(name: "Board", size: 44.6, length: 100, width: 34)
board.printShape()

var plate: Circle = Circle(n: "Plate", s: 22.3, r: 10)

plate.printShape()
