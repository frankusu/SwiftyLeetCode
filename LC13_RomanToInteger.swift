/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.
 
 Example 1:

 Input: s = "III"
 Output: 3
 Explanation: III = 3.
 Example 2:

 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
 Example 3:

 Input: s = "MCMXCIV"
 Output: 1994
 Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 */
class Solution {
    func romanToInt(_ s: String) -> Int {

        var prevChar = "A"
        var result = 0

        for char in s {
            switch char {
                case "I":
                    result += 1
                    prevChar = "I"
                case "V":
                    result += prevChar == "I" ? 3 : 5
                    prevChar = "V"
                case "X":
                    result += prevChar == "I" ? 8 : 10
                    prevChar = "X"
                case "L":
                    result += prevChar == "X" ? 30 : 50
                    prevChar = "L"
                case "C":
                    result += prevChar == "X" ? 80 : 100
                    prevChar = "C"
                case "D":
                    result += prevChar == "C" ? 300 : 500
                    prevChar = "D"
                case "M":
                    result += prevChar == "C" ? 800 : 1000
                    prevChar = "M"
                default:
                    result += 0
            }
        }
        return result

    }
}
// Runtime 17ms Beats 74.49%
//Memory 14.4 MB Beats 58.41%

// super genius solution 4ms
enum Roman: Int {
    case I = 1
    case V = 5
    case X = 10
    case L = 50
    case C = 100
    case D = 500
    case M = 1000
}

extension String {
    var toRoman: Roman {
        switch self {
        case "I":
            return .I
        case "V":
            return .V
        case "X":
            return .X
        case "L":
            return .L
        case "C":
            return .C
        case "D":
            return .D
        case "M":
            return .M
        default:
            return .I
        }
    }
}

class Solution {
    func romanToInt(_ s: String) -> Int {
        var ans = 0
        var lastSym = Roman.I
        for c in s.reversed() {
            let sym = String(c).toRoman
            if sym.rawValue < lastSym.rawValue {
                ans -= sym.rawValue
            } else {
                ans += sym.rawValue
            }
            lastSym = sym
        }
        return ans
    }
}
