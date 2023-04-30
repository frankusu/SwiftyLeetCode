// 2. Add Two Numbers
// You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 *
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 *
 Input: l1 = [0], l2 = [0]
 Output: [0]
 *
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var llOne = l1
        var llTwo = l2
        let result = ListNode()
        var travelList: ListNode? = result
        var carry = 0
        
        // keep in mind the carry != 0 or carry > 0 since if the ll runs out, it won't add a new node
        while llOne != nil || llTwo != nil || carry != 0 {
            
            var valOne = llOne != nil ? llOne!.val : 0
            var valTwo = llTwo != nil ? llTwo!.val : 0

            var digitResult = carry + valOne + valTwo
            carry = digitResult / 10

            travelList?.next = ListNode(digitResult % 10)
            travelList = travelList?.next

            llOne = llOne != nil ? llOne?.next : nil
            llTwo = llTwo != nil ? llTwo?.next : nil
        }

        return result.next
    }
}

// Runtime 36 ms beats 83.75%
// Memory 14.1 MB beats 41.94%
