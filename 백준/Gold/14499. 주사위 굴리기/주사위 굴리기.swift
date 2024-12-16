enum Direction: Int {
  case down = 4
  case right = 1
  case left = 2
  case up = 3
  
  func canMove(from current: (x: Int, y: Int), graph: (x: Int, y: Int)) -> Bool {
    switch self {
    case .down:
      return current.x + 1 < graph.x
    case .left:
      return current.y - 1 >= 0
    case .right:
      return current.y + 1 < graph.y
    case .up:
      return current.x - 1 >= 0
    }
  }
  
  func nextPosition(from current: (x: Int, y: Int)) -> (Int, Int) {
    switch self {
    case .down:
      return (current.x + 1, current.y)
    case .left:
      return (current.x, current.y - 1)
    case .right:
      return (current.x, current.y + 1)
    case .up:
      return (current.x - 1, current.y)
    }
  }
}

class Dice {
  var top: Int = 0
  var right: Int = 0
  var left: Int = 0
  var bottom: Int = 0
  var up: Int = 0
  var down: Int = 0
  
  func move(_ direction: Direction, tileNumber: Int) -> Int {
    let u = self.up
    let d = self.down
    let t = self.top
    let b = self.bottom
    let r = self.right
    let l = self.left
    
    switch direction {
    case .down:
      self.top = u
      self.down = t
      self.bottom = d
      self.up = b
    case .right:
      self.top = l
      self.right = t
      self.bottom = r
      self.left = b
    case .left:
      self.top = r
      self.right = b
      self.left = t
      self.bottom = l
    case .up:
      self.top = d
      self.down = b
      self.bottom = u
      self.up = t
    }
    
    if tileNumber != 0 {
      self.bottom = tileNumber
    }
    
    print(self.top)
    
    return self.bottom
  }
}

let dice = Dice()
let mnxyk = readLine()!.split(separator: " ").map { Int($0)! }
let m = mnxyk[0], n = mnxyk[1]
var x = mnxyk[2], y = mnxyk[3]

var graph: [[Int]] = Array.init(repeating: [], count: m)

for i in 0..<m {
  graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let command = readLine()!.split(separator: " ").map { Int($0)! }

command.forEach { c in
  let direction = Direction(rawValue: c)!
  
  if direction.canMove(from: (x, y), graph: (m, n)) {
    let current = direction.nextPosition(from: (x, y))
    x = current.0
    y = current.1

    let tileNumber = graph[current.0][current.1]
    let bottomNumber = dice.move(direction, tileNumber: tileNumber)
    graph[current.0][current.1] = tileNumber == 0 ? bottomNumber : 0
  }
}