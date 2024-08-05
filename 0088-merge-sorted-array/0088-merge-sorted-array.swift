class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let arr1 = nums1.enumerated().filter{ $0.0 < m }
        let arr2 = nums2.enumerated().filter{ $0.0 < n }
        nums1 = (arr1 + arr2).map{ Int($0.1) }.sorted()
    }
}