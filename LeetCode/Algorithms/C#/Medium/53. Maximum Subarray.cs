/*
  Given an integer array nums, find the subarray which has the largest sum and return its sum.

  Example 1:
    Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
    Output: 6
    Explanation: [4,-1,2,1] has the largest sum = 6.

  Example 2:
    Input: nums = [1]
    Output: 1

  Example 3:
    Input: nums = [5,4,-1,7,8]
    Output: 23

  Constraints:
    1 <= nums.length <= 105
    -104 <= nums[i] <= 104

  Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
*/

// Approach: Brute force
// Time Complexity: O(n^2)
// Space Complexity: O(1)

public class Solution {
    public int MaxSubArray(int[] nums) {
      //criar sum
      //for
        //for
          //se a sum for recorde
            //guardar sum

      int sum = nums[0];
      int currSum;

      for(int i = 0; i < nums.Length; i++) {
        currSum = 0;
        for(int j = i; j < nums.Length; j++) {
          currSum += nums[j];
          if(currSum > sum)
            sum = currSum;
        }
      }

      return sum;
    } 
}

// Approach: Dynamic Programming, Kadane's Algorithm
// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
    public int MaxSubArray(int[] nums)
    {
      int currSum = nums[0], maxSum = nums[0];

      for(int i = 1; i < nums.Length; i++) {
        currSum += nums[i];
      
        // if you sum and it's less than the current number, use the current number
        if(currSum < nums[i])
          currSum = nums[i];

        if(currSum > maxSum)
          maxSum = currSum;
      }

      return maxSum;
    }
}

// Approach: Dynamic Programming, Kadane's Algorithm with Math.Max()
// Time Complexity: O(n)
// Space Complexity: O(1)

public class Solution {
  public int MaxSubArray(int[] nums)
  {
    int currSum = nums[0], maxSum = nums[0];

    for(int i = 1; i < nums.Length; i++) {
      // if you sum and it's less than the current number, use the current number
      currSum = Math.Max(currSum + nums[i], nums[i]);
      
      maxSum = Math.Max(maxSum, currSum);
    }

    return maxSum;
  }
}