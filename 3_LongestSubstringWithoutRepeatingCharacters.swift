//3.LongestSubstringWithoutRepeatingCharacters
/**
 Given a string s, find the length of the longest substring without repeating characters.
 
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var startPointer = 0
        var endPointer = 0
        var charSet = Set<Character>()
        let stringArray = Array(s)
        var result = 0

        while(endPointer < stringArray.count) {
            if !charSet.contains(stringArray[endPointer]) {
                charSet.insert(stringArray[endPointer])
                endPointer += 1
                result = max(result, charSet.count)
            } else {
                charSet.remove(stringArray[startPointer])
                startPointer += 1
            }
        }
        return result
    }
}

// Runtime 30 ms beats 44.8%
// Memory 15.1 MB beats 13.12%

