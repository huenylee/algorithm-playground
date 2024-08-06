class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for num in nums {
            let i = dict[num] ?? 0
            dict[num] = i + 1
        }
        let output = dict.max { $0.value < $1.value }!
        return output.key
    }
}