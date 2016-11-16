# FOCS Homework 19

```
Student Name: Solution Set
Check one:
[ ] I completed this assignment without assistance or external resources.
[x] I completed this assignment with assistance from teaching staff
   and/or using these external resources: ___
```

## 1. Predicate Calculus – Models

| x    | y    |
| ---- | ---- |
| a    | b    |
| b    | c    |
| a    | c    |
| c    | d    |
| d    | c    |
| c    | c    |
| b    | a    |

*Table 1*: A model for `loves(x, y)`

a. For each of the following, is Table 1 a model?  Explain briefly why or why not.

1. ∃x. ∀y. loves(x, y)

   No. There is no x that loves everbody. a and b don't love d, therefore a and b don't work as x. c and d don't love a, therefore c and d don't work as x.

2. ∃y. ∀x. loves(c, y)
   Yes. Everybody loves c. Therefore there exists a y (y=c) such that everbody loves y.

3. ∀x. ∃y. loves(x, y)
   Yes. For everbody, there is someone that they love. a loves b, b loves a, c loves d, and d loves c.

4. ∀y. ∃x. loves(x, y)
   Yes. For everybody, there is someone who loves them. a loves b, b loves a, c loves d, and d loves c.

5. ∃x. ∃y. loves(x, y)
   Yes. There is someone who loves someone. For example, a loves b.

6. ∃x. ∀y. ¬loves(x, y)
   No. There is no who doesn't love anyone.

7. ∃x. ¬∀y. loves(x, y)
   Yes. There is someone who doesn't love everyone. For example, a doesn't love c.

b. Consider three models: (i) objects are a, b, c, d; `loves` is Table 1; (ii) objects are integers; `loves(x, y) ` ≝ x ≧ y; (iii) `loves(x, y)` ≝ x = y. In which of these models are these statements true:

| Statement                                | Table 1 | x ≧ y | x = y |
| ---------------------------------------- | ------- | ----- | ----- |
| ∀x, x. loves(x, x) [should read ∀x. loves(x, x)] | False   | True  | True  |
| ∀x, y. loves(x, y) → loves(y, x)         | False   | False | True  |
| ∀x, y, z. loves(x, y) ∧ loves(y, z) → loves(x, z) | False   | True  | True  |

∀x. loves(x, x): x=a is a counter-example. All integers are ≧ themselves by definition of ≧, and all integer are = themselves by definition of =, so the remaining two cells in the first row are true.

∀x, y. loves(x, y) → loves(y, x): {x=a, y=b} and {x=1, y=2} is a counter-example. If x = y then y = x (= is reflexive), so the third cell in the second row is true.

∀x, y, z. loves(x, y) ∧ loves(y, z) → loves(x, z): {a=a, y=b, z=c} is a counter-example. ≧ and = are transitive, so the second and third cells in the third row are true.

c. (Optional) (Because we love graphs) Draw Table 1 as a digraph. What claims do each of the following make about a node x or y, in terms of its indegree and outdegree?

The following graph represents likes(x, y) with an arrow x → y.

![](./images/likes.svg)

1. ∀x. loves(x, y).
   y has an indegree equal to the number of nodes in the graph. In this model, y has an indegree of 4. (There are four nodes, and ∀x quantifies over all of them.) This is true only for c.
2. ∀y. loves(x, y).
   x has an outdegree of 4. Since no node has outdegree > 3, there is no value for x that makes the proposition true.
3. ∃x. loves(x, y)
   y has an indegree of at least one. This is true of every node. (Everyone has someone who likes them.)
4. ∃y. loves(x, y)
   x has an outdegree of at least one. This is true of every node. (Everyone has someone they likes.)

likes(x, y) could also be represented by an opposite arrow y → x. With this graph, the use of “indegree” and “outdegree” in (1-4) would be swapped.

## 2. Predicate Calculus – Proofs

Given axioms:

1. ∀x. sum( x, 0, x )
2. ∀x, y, z. sum( x, y, z ) → sum( x, s(y), s(z) )
3. ∀x . product( x, 0, 0 )
4. ∀x, y, z, k. product( x, y, z ) ∧  sum( x, z, k ) → product( x, s(y), k )

Prove:

1.  ∃x. sum( x, x, s(s(0)) )

    ```
    1. ∀x. sum( x, 0, x )				axiom 1
    2. sum( s(0), 0, s(0) )				1, universal instantiation x = s(0)
    3. ∀x, y, z. sum( x, y, z ) → sum( x, s(y), s(z) )		axiom 2
    4. sum( s(0), 0, s(0) ) → sum( s(0), s(0), s(s(0)) )	3, universal instantiation with x = z = s(0), y = 0
    5. sum( s(0), s(0), s(s(0)) )		2, 4, modus ponens
    6. ∃x. sum( x, x, s(s(0)) )			5, existential generalization with x = s(0)
    ```

2.  ∀x. sum( 0, x, x ) [hint:  induction]

     ```
    1. ∀x. sum( x, 0, x )				axiom 1
    2. sum( 0, 0, 0 )					1, universal instantation with x = 0
    3. ∀x, y, z. sum( x, y, z ) → sum( x, s(y), s(z) )		axiom 2
    4. sum( 0, n, n ) → sum( 0, s(n), s(n) )				3, universal instantiation with x = 0, y = z = k
    5. ∀x. sum( 0, x, x )				1 (base case), 4 (inductive step), induction
     ```


3. [optional super-challenge] ∀x, y, z. sum( x, y, z ) → sum( y, x, z )
   Proof sketch:

   1. Prove ∀x, z. sum( x, S(0), z ) → sum( S(0), x, z )
   2. Prove ∀x, y, z. (sum( x, y, z ) → sum( y, x, z )) → (sum( x, S(y), z ) → sum( S(y), x, z ))
   3. Induction on 1, 2.

    ```
   TBD
    ```


## 3. Maximum Subarray

[in progress]