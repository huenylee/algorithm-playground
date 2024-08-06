class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        (0..<k).forEach { _ in
            nums = [nums.removeLast()] + nums
        }
    }
}