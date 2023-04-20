/**
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 */

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else if !stack.isEmpty {
                let last = stack.removeLast()
                if last == "(" && char == ")" {
                    continue
                } else if last == "{" && char == "}" {
                    continue
                } else if last == "[" && char == "]" {
                    continue
                } else {
                    return false
                }
            } else {
                return false
            }
        }

        return stack.isEmpty

    }
}

// Runtime 3 ms Beats 69.2%
// Memory 14.3 MB Beats 47.81%

// 0ms genius solution
class Solution {
    func isValid(_ s: String) -> Bool {
       var openSet : Set<Character> = ["(", "{", "["]
       var closeSet : Set<Character> = [")", "}", "]"]
       var map : [Character : Character] = ["(" : ")", "{" : "}", "[" : "]"]
       var stack = [Character]()
       let sArray = Array(s)
       for c in sArray {
           if openSet.contains(c) {
               stack.append(c)
           } else if closeSet.contains(c) {
               if !stack.isEmpty {
                   let poppedChar = stack.removeLast()
                   if map[poppedChar] != c {
                       return false
                   }
               }else {
                   return false
               }
           }
       }
       return stack.isEmpty
    }
}

