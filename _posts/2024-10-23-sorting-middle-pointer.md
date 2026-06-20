---
layout: post
title: "Why use left+(right-left)/2 instead of (left+right)/2 in sorting algorithms"
date: 2024-10-23
---

In most sorting algorithms that use the divide and conquer approach, you'd need to find the middle index between two indices. If l is the left index and r is the right index, then our most obvious approach towards finding the half or middle of the two is `m = (l+r)/2`. But, this can create an integer overflow when both l & r are large. Here's why, you must use: `m = l + (r-l)/2`:

Suppose you have l & r as:

```cpp
int l = INT_MAX;
int r = INT_MAX;
```

Using `int m = (l+r)/2` we would get:

`m = (INT_MAX + INT_MAX) / 2` in which `(INT_MAX + INT_MAX)` creates an integer overflow.

Now, if we use `int m = l + (r-l)/2`:

`m = INT_MAX + (INT_MAX - INT_MAX)/2` and, here we do not have an integer overflow.

But, this process will not prevent integer overflow in cases when l & r are large numbers of opposite signs, eg:

```cpp
int l = INT_MAX;
int r = INT_MIN;
```

In fact, it will create an integer overflow in this case whereas `(l+r)/2` will not.

But, as long as we're talking about sorting algorithms, l & r are indices (0&lt;=l&lt;r), therefore they will both be positive. Thus, using `l+(r-l)/2` over `(l+r)/2` helps prevent integer overflow in sorting algorithms.
