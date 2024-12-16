typealias Coord = (r: Int, c: Int)

// 입력 받기
let nm: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let n: Int = nm[0]
let m: Int = nm[1]
var graph: [[Int]] = Array.init(repeating: [], count: n)
var visited: [[Bool]] = Array.init(repeating: Array.init(repeating: false, count: m), count: n)

(0..<n).forEach { graph[$0] = readLine()!.split(separator: " ").map { Int($0)! }}

// 방향 배열
let d: [Coord] = [(-1, 0), (0, -1), (1, 0), (0, 1)]

// ㅜ ㅏ ㅓ ㅗ
let fk: [[Coord]] = [
  [(0,0),(0,1),(0,2),(1,1)],
  [(0,0),(1,0),(2,0),(1,1)],
  [(0,0),(0,1),(0,2),(-1,1)],
  [(0,0),(0,1),(-1,1),(1,1)]
]

var result: Int = 0

func dfs(x: Int, y: Int, depth: Int, sum: Int) {
  if depth == 4 {
    result = max(result, sum)
    return
  }
  
  for i in 0..<4 {
    let nx = x + d[i].r
    let ny = y + d[i].c
    
    guard nx >= 0 && nx < n && ny >= 0 && ny < m else { continue }
    
    if visited[nx][ny] == false {
      visited[nx][ny] = true
      dfs(x: nx, y: ny, depth: depth + 1, sum: sum + graph[nx][ny])
      visited[nx][ny] = false
    }
  }
}

func checkFk(_ r: Int, _ c: Int) {
  for i in 0..<4 {
    var sum = 0
    var isComplete = true
    for j in 0..<4 {
      let nr = r + fk[i][j].r
      let nc = c + fk[i][j].c
      
      guard 0 <= nr && nr < n && 0 <= nc && nc < m else {
        isComplete = false
        break
      }
      
      sum = sum + graph[nr][nc]
    }
    if isComplete == true {
      result = max(result, sum)
    }
  }
}

for r in 0..<n {
  for c in 0..<m {
    visited[r][c] = true
    dfs(x: r, y: c, depth: 0, sum: 0)
    visited[r][c] = false
    
    checkFk(r, c)
  }
}

print(result)