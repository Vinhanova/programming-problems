/*
  Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

  Example 1:
    Input: nums = [1,2,3,4,5,6,7], k = 3
    Output: [5,6,7,1,2,3,4]
  Explanation:
    rotate 1 steps to the right: [7,1,2,3,4,5,6]
    rotate 2 steps to the right: [6,7,1,2,3,4,5]
    rotate 3 steps to the right: [5,6,7,1,2,3,4]

  Example 2:
    Input: nums = [-1,-100,3,99], k = 2
    Output: [3,99,-1,-100]
  Explanation: 
    rotate 1 steps to the right: [99,-1,-100,3]
    rotate 2 steps to the right: [3,99,-1,-100]

  Constraints:
    1 <= nums.length <= 105
    -231 <= nums[i] <= 231 - 1
    0 <= k <= 105

  Follow up:
    Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
    Could you do it in-place with O(1) extra space?
*/


// Time Complexity: O(n)
// Space Complexity: O(n)

public class Solution {
  public void Rotate(int[] nums, int k) {
    if(nums.Length <= 1 || k == 0) return;
    
    var temp = nums.ToArray();

    // for i = k, i < nums.Length
      // guardar
    
    for(int i = 0; i < temp.Length; i++) {
      nums[(i + k) % temp.Length] = temp[i];
    }
  }
}


// Reverse Method
// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
  public void Rotate(int[] nums, int k) {
    if(nums.Length <= 1 || k == 0) return;

    int n = nums.Length;
    k %= n;
    Reverse(nums, 0, n - 1);
    Reverse(nums, 0, k - 1);
    Reverse(nums, k, n - 1);

  }

  public void Reverse(int[] arr, int start, int end) {
    int temp;
    for(; start < end; start++, end--) {
      temp = arr[end];
      arr[end] = arr[start];
      arr[start] = temp;
    }
  }
}