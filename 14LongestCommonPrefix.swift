class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if (strs.count == 0) { return ""}
        let stringArray = strs.map { Array($0) }
        var firstStringArray = stringArray[0]
        var result = ""

        for charIndex in 0..<firstStringArray.count {
            let currChar = firstStringArray[charIndex]
            var isOkToAdd = true
            for stringIndex in 1..<strs.count {
                if stringArray[stringIndex].count > charIndex {
                    if stringArray[stringIndex][charIndex] != currChar {
                        isOkToAdd = false
                         break
                    }
                } else {
                    isOkToAdd = false
                    break
                }
            }
            if isOkToAdd { result += "\(currChar)"} else {
                break
            }
        }
        return result
    }
}

// Runtime 11 ms Beats 70.63%
// Memory 14.5 MB Beats 53.56%

// 0ms first solution
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }

        var pref = strs[0]

        for i in 1..<strs.count {
            let str = strs[i]

            while !str.hasPrefix(pref) {
                pref = String(pref.dropLast())
            }

            if pref.isEmpty {
                return ""
            }
        }
        return pref
    }
}
