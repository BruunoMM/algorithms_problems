<h1>
Shift Linked List
</h1>
<h3><b>
Write a function that takes in the head of a Singly Linked List and an integer k, shifths the list in place (i.e. doesn't create a brand new list) by `k` positions and return it's new head.
<br><br>
Shifting a Linked List means moving its nodes forward or backward and wrapping them around the list where appropriate. For example, shifting a Linked List forward by one position would make its tail become the new head of the Linked List.
Whether nodes are moved forward or backward is determined by whether `k` is positive or negative.
<br><br>
<p style="color:#ff0066">
Each `LinkedList` node has an integer `value` as well as a `next` node pointing to the next node in the list or to `None`/`nil` if it's the tail of the list.

You can assume that the input Linked List will always have at least one node; in other words, the head will never be `None`/`nil`.
</p>
</h3></b>

`Sample Input`
```swift
head = 0 -> 1 -> 2 -> 3 -> 4 -> 5 // the head node with value 0
k = 2
```

`Sample Output`
```swift
4 -> 5 -> 0 -> 1 -> 2 -> 3 // the new head node with value 4
```