---
title: 'Leetcode - 242 Valid Anagram'
draft: false
tags: [leetcode]
showTags: true
date: 2024-12-02T22:24:00+07:00
summary: "Note for Leetcode 242 - Valid Anagram"
description: "Note for Leetcode 242 - Valid Anagram"
readTime: true
autonumber: true
math: true
tldr: hehehe
---

## Problem overview
Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.

**Example 1:**

> **Input:** s="anagram", t="nagaram"
>
> **Output:** true

**Example 2:**

> **Input:** s="rat", t="car"
>
> **Output:** false

**Constraints:**

- `s` and `t` consist of lowercase English letters.

## Solutions
### Sorted
#### Idea
The most straightforward approach is to sort two strings and then compare if they are equal.
#### Complexity
- Time: $O(n\log{}n)$ - This is due to the sorting process.
- Space: $O(1)$ - Normally, sorting does not require extra memory.



### Hash map
#### Idea
The main idea is to count the frequency of characters in each string, then compare these frequencies to see if there are mismatches.
Instead of using the hashmap directly, we have a clever way of storing the frequency in an array of length 26 (the number of the characters).
We just need one pass, in which we:
- Increase the count for characters in string `s`.
- Decrease the count for characters in string `t`.

Finaly, if the the array contains all 0, 2 strings are anagrams.

#### Implementation
```python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        count = [0] * 26

        if len(s) != len(t):
            return False

        ord_a = ord("a")
        for i in range(len(s)):
            count[ord(s[i]) - ord_a] += 1
            count[ord(t[i]) - ord_a] -= 1

        for c in count:
            if c != 0:
                return False

        return True
```

#### Complexity
- Time: $O(n)$ - We just pass through the strings once.
- Space: $ O(1) $ - The array we use to store the frequency has fixed size.
