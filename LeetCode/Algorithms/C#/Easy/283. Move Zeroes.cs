/*
  Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
  Note that you must do this in-place without making a copy of the array.

  Example 1:
    Input: nums = [0,1,0,3,12]
    Output: [1,3,12,0,0]

  Example 2:
    Input: nums = [0]
    Output: [0]

  Constraints:
    1 <= nums.length <= 104
    -231 <= nums[i] <= 231 - 1
  
  Follow up: Could you minimize the total number of operations done?
*/

// Approach: One Pointer
// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
    public void MoveZeroes(int[] nums) {
      // [0,1,0,3,12] 0
      // [1,0,0,3,12] 1
      // [1,0,0,3,12] 1
      // [1,3,0,0,12] 2
      // [1,3,12,0,0] 3

      int zeroIndex = -1;

      for(int i = 0; i < nums.Length; i++) {
        // if num == 0 and there is no spot available, save the spot
        if(nums[i] == 0 && zeroIndex == -1)
          zeroIndex = i;
        // else if num != 0 and there is space available, swap and advance to next spot
        else if(nums[i] != 0 && zeroIndex != -1) {
          nums[zeroIndex] = nums[i];
          nums[i] = 0;
          zeroIndex++;
        }
      }
    }
}

// Approach: One Pointer improved with search
// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
    public void MoveZeroes(int[] nums) {
      int zeroIndex = 0, aux;

      for(int i = 0; i < nums.Length; i++) {
        if(nums[i] != 0) {
          aux = nums[zeroIndex];
          nums[zeroIndex] = nums[i];
          nums[i] = aux;
          zeroIndex++;
        }
      }
    }
}