
# FOCS Homework 15, for Day 15

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Frankly Olin [change to your name]
Check one:
[ ] I completed this assignment without assistance or external resources.
[X] I completed this assignment with assistance from David, Annabel, Nur (We worked on the hw together)
   and/or using these external resources: ___
```


## I. Binary search tree ordering


Assume that the following tree structures are all properly constructed binary search trees, preserving the binary search property that any (internal) node's left child is smaller than the internal node and its right child is larger (or of equal value).  

Anything labeled with a T can be assumed to be a (possibly empty) subtree (i.e., may contain zero or more nodes); anything labeled with a lower case letter is a single node.

What inequalities must hold in each of these trees?

### 0.
```
        a
       / \
      /   \
    T1     T2
```

Ans:  all elements of T1 <= a <= all elements of T2

### 1.
```
        b
       / \
      /   \
     c     T3
    / \
   /   \
 T1    T2
```

Ans:  all elements of T1 <= c <= all elements of T2
      all elements of T1 and T2 and c <= b <= all elements of T3

### 2.
```
        d
       / \
      /   \
    T1     e
          / \
         /   \
       T2    T3
```

Ans:  all elements of T2 <= e <= all elements of T3
      all elements of T1 <= d <= all elements of T2, T3 and e


### 3.
```
        f
       / \
      /   \
     g     T4
    / \
   /   \
 T1     h
       / \
      /   \
    T2     T3
```

Ans:  all elements of T2 <= h <= all elements of T3
      all elements of T1 <= g <= all elements of T2, T3 and h


## II.  Extending this analogy:  drawing trees.

### 4. 

What other tree structures containing three internal nodes -- x, y, and z -- can exist?  Draw these and describe the inequalities that exist among the internal nodes and their subtrees.  
[Hint:  There should be four more shapes.]  
The relationship among x, y, and z doesn't matter.  For convenience, we've arbitrarily labeled them top to bottom and the subtrees left to right.

```
1.
         x
       /   \
      /     \
     y       z
    / \     / \
   /   \   /   \
 T1    T3 T4    T2

2.
          x
         / \
        /   \
       y     T2
      / \
     /   \
    z    T3
   / \
  /   \
 T1   T4

3.
        x
       / \
      /   \
     y     T2
    / \
   /   \
  T3    z    
       / \
      /   \
     T1   T4

4.
        x
       / \
      /   \
     T2    y     
          / \
         /   \
        z    T3
       / \
      /   \
     T1   T4

5.
        x
       / \
      /   \
     T2    y     
          / \
         /   \
        T3    z    
             / \
            /   \
           T1   T4

```

## III.  Observing balance

It is desirable for binary search trees to be balanced (or close).  If we assume that each of the T structures has the same depth, the two-internal-node trees have the following property:

For EVERY internal node (x and y), the depth of the internal node's left subtree and the depth of the internal node's right subtree differ by at most 1.  We call these trees almost-balanced.  

### 5. 

Does this property hold for any of the three-internal-node trees?  Which ones?  Which ones are NOT almost-balanced?  (We call these unbalanced.)

Balanced trees: 1st
Not Balanced trees: 2nd, 3rd, 4th, 5th

## IV.  Maintaining balance

Observe the following:

If you are given a binary tree of the form in question 1, you can transform them into the form in question 2 (and vice versa) while preserving the binary search property.  
[Since they are both almost-balanced, this doesn't help, but it also doesn't hurt.]  

### 6. 

Use this insight to show how to modify each of the unbalanced tree forms with three internal nodes into an almost-balanced tree that preserves the binary search property.

Below are transformed, balanced version of trees numbered 2 to 5

```
2.
          y
         / \
        /   \
       z     x

3.

z>y and x>y. Ambiguous and therefore cannot balance it

4.

z>y and x>y. Ambiguous and therefore cannot balance it

5.
          y
         / \
        /   \
       x     z
```

## V.  Rebalancing

### 7. 

Verify that the following tree is almost-balanced:

For EVERY internal node (x and y), the depth of the internal node's left subtree and the depth of the internal node's right subtree differ by at most 1. 

```
         8
        / \
       /   \
      6     14
     /\      /\  
    /  \    /  \ 
   3   7   12   16  
  /\       /    /\ 
 /  \     /    /  \ 
2    5   10   15   20
                   /
                  /
                 18
```
It is balanced for every node. The height differs at most by 1.

### 8. 

Insert the value 13 into this tree.  Where does it go?  Is the resulting tree almost-balanced?  If not, see #11.

```
         8
        / \
       /   \
      6     14
     /\     / \  
    /  \   /   \ 
   3   7  12    16  
  /\      /\     /\ 
 /  \    /  \   /  \ 
2    5  10  13 15   20
                   /
                  /
                 18
```
It is balanced.

### 9. 

Insert the value 17 into the tree.  Where does it go?  Is the resulting tree almost-balanced?  If not, see #11.

```
         8
        / \
       /   \
      6     14
     /\     / \  
    /  \   /   \ 
   3   7  12    16  
  /\      /\     /\ 
 /  \    /  \   /  \ 
2    5  10  13 15   20
                   /
                  /
                 18
                /
               /
              17
```
Not balanced. So let's balance it
```
         8
        / \
       /   \
      6     14
     /\     / \  
    /  \   /   \ 
   3   7  12    16  
  /\      /\     /\ 
 /  \    /  \   /  \ 
2    5  10  13 15  18
                   / \
                  /   \
                 17   20            
```
### 10. 

Insert the value 4 into the tree.  Where does it go?  Is the resulting tree almost-balanced?  If not, see #11.

```
         8
        / \
       /   \
      6     14
     /\     / \  
    /  \   /   \ 
   3   7  12    16  
  /\      /\     /\ 
 /  \    /  \   /  \ 
2    5  10  13 15  18
    /              / \
   /              /   \
  4              17   20            
```
Balanced

### 11. 

Use the work you've done above to rebalance the tree.  Start at the newly inserted value; work up until you find an internal node that has left and right children whose depth differs by more than one.  Rebalance that subtree using the processes you created in #6.  Continue to climb the tree, rebalancing any unbalanced (not almost-balanced) nodes as you go up.

Balanced

### 12. 

[Challenge] Assuming that a tree is almost-balanced when you make an insertion, and that that insertion may violate the almost-balanced property, can almost-balance always be restored solely by climbing the  path from the newly inserted node to the root?  Will you ever have to descend another branch?  Why or why not?

