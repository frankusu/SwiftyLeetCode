/*
 28. Find the Index of the First Occurrence in a String
 
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

  

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
 */
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hArray = Array(haystack)
        let nArray = Array(needle)
        let maxCount = hArray.count - nArray.count
        if maxCount < 0 { return -1 }
        for index in 0...(maxCount) {
            // if nArray == Array(hArray[index..<(index + nArray.count)]) { return index }
            for needleIndex in 0..<nArray.count {
                if hArray[index + needleIndex] != nArray[needleIndex] { break }
                if needleIndex == (nArray.count - 1) { return index }
            }
        }
        return -1
    }
}

//Runtime 0 ms Beats 100%
//Memory 14.2 MB Beats 69.22%
