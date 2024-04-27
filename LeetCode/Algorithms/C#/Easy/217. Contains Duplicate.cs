/*
  Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

  Example 1:
    Input: nums = [1,2,3,1]
    Output: true

  Example 2:
    Input: nums = [1,2,3,4]
    Output: false
  
  Example 3:
    Input: nums = [1,1,1,3,3,4,3,2,4,2]
    Output: true
  

  Constraints:
    1 <= nums.length <= 105
    -109 <= nums[i] <= 109
*/


// Approach: HashSet with Dicionary
// Time Complexity: O(n)
// Space Complexity: O(n)

public class Solution {
    public bool ContainsDuplicate(int[] nums) {
      // criar um dic
      // for
        // se o dic contem num
          // return true
        // guardar no dic
      
      // return false

      Dictionary<int, int?> dic = new Dictionary<int, int?>();

      for(int i = 0; i < nums.Length; i++) {
        if(dic.ContainsKey(nums[i])) return true;
        dic.Add(nums[i], null);
      }

      return false;


      HashSet<int> dic = new HashSet<int>();

      for(int i = 0; i < nums.Length; i++) {
        if(dic.Contains(nums[i])) return true;
        dic.Add(nums[i]);
      }

      return false;
    }
}


// Approach: HashSet
// Time Complexity: O(n)
// Space Complexity: O(n)

public class Solution {
    public bool ContainsDuplicate(int[] nums) {
      HashSet<int> hs = new HashSet<int>();

      for(int i = 0; i < nums.Length; i++) {
        if(hs.Contains(nums[i])) return true;
        hs.Add(nums[i]);
      }

      return false;
    }
}