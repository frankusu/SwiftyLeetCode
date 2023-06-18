//219. Contains Duplicate II
/**
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 */
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: [Int]]()
        for (index, val) in nums.enumerated() {
            if dict[val] == nil {
                dict[val] = [index]
            } else {
                dict[val]!.append(index)
            }
        }

        for (key, val) in dict {
            for index in 0..<val.count-1 {
                if (abs(val[index] - val[index+1]) <= k) {
                    return true
                }
                
            }
        }
        return false

    }
}
//Runtime 741ms Beats 20.61%
//Memory 20.9 MB Beats 6.87%

// Way better solution 673 ms
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int:Int]()
        for index in 0..<nums.count {
            if let oldIndex = dict[nums[index]] {
                if index - oldIndex <= k { return true }
            }
            dict[nums[index]] = index
        }
        return false
        
    }
}
