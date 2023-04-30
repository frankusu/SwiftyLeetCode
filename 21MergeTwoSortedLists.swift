/*
 21. Merge Two Sorted Lists
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

  

 Example 1:


 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: list1 = [], list2 = []
 Output: []
 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1, list2 = list2
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        let head = ListNode()
        var listPointer: ListNode? = head

        while list1 != nil && list2 != nil {
            let val1 = list1!.val
            let val2 = list2!.val

            if val1 >= val2 {
                listPointer!.next = ListNode(val2)
                list2 = list2!.next
            } else {
                listPointer!.next = ListNode(val1)
                list1 = list1!.next
            }

            if listPointer!.next != nil {
                listPointer = listPointer!.next
            }
        }

        if list1 != nil && list2 == nil {
            listPointer!.next = list1
        } else if list1 == nil && list2 != nil {
            listPointer!.next = list2
        }
        return head.next

    }
}

// Runtime 11 ms Beats 73%
// Memory 14.2 MB Beats 36%


