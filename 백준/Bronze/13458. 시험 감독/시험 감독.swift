let n: Int = Int(readLine()!)!
let k: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let s: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

let r: Int = k.map { i in
  let ms = 1
  let ls = max(0, i - s[0])
  let ss = ls == 0 ? 0 : (ls + s[1] - 1) / s[1]
  return ms + ss
}.reduce(0, +)

print(r)