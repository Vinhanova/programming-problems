/*
  Given the head of a singly linked list, return the middle node of the linked list.
  If there are two middle nodes, return the second middle node.

  Example 1:
    Input: head = [1,2,3,4,5]
    Output: [3,4,5]
    Explanation: The middle node of the list is node 3.
  
  Example 2:
    Input: head = [1,2,3,4,5,6]
    Output: [4,5,6]
    Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
 
  Constraints:
    The number of nodes in the list is in the range [1, 100].
    1 <= Node.val <= 100

  @param {ListNode} head
  @return {ListNode}
*/

// My first approach: Duplicate to array
// Time Complexity: O(n)
// Space Complexity: O(n)

var middleNode = function (head) {
  let aux = head
  let arr = []
  while (aux?.val) {
    arr.push(aux)
    aux = aux.next
  }

  return arr[Math.floor(arr.length / 2)]
}

// My second approach: Duplicate to array but cleaner
// Time Complexity: O(n)
// Space Complexity: O(n)

var middleNode = function (head) {
  let newHead = [head]

  while (newHead[newHead.length - 1].next) {
    newHead.push(newHead[newHead.length - 1].next)
  }

  return newHead[Math.floor(newHead.length / 2)]
}

// My third approach: Fast and slow pointers
// Time Complexity: O(n)
// Space Complexity: O(1)

var middleNode = function (head) {
  let slow = head,
    fast = head

  while (slow.next && fast.next?.next) {
    slow = slow.next
    fast = fast.next.next
  }

  return fast.next ? slow.next : slow
}

// My fourth approach: Fast and slow pointers but cleaner // Submitted
// Time Complexity: O(n)
// Space Complexity: O(1)

var middleNode = function (head) {
  slow = fast = head

  while (fast && fast.next) {
    slow = slow.next
    fast = fast.next.next
  }
  return slow
}

// My fifth approach: Fast and slow pointers reusing head
// Time Complexity: O(n)
// Space Complexity: O(1)

var middleNode = function (head) {
  fast = head

  while (fast && fast.next) {
    head = head.next
    fast = fast.next.next
  }
  return head
}
