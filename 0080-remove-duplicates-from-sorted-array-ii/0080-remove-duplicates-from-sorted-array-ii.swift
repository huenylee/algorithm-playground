class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var dict: [Int: Int] = [:]
        nums.forEach { num in
            dict[num] = nums.filter { $0 == num }.count
        }
        var removed: [Int] = []
        dict.keys.sorted().map { value in
            (0..<min(2,dict[value]!)).forEach { num in
                removed.append(value)
            }
        }
        nums = removed
        return nums.count
    }
}