# Course: ENGR3520
# Author: Oliver Steele
# Date: 2016-10-01

# Helper function to actually do the arithmetic
def apply_op(op, a, b):
    import operator
    ops = {'+': operator.add, '-': operator.sub, '*': operator.mul}
    return ops[op](a, b)

# AS-YOU-GO Calculation (finite registers)
def calc_as_you_go(input):
    """
    >>> calc_as_you_go([1, '+', 2])
    3
    >>> calc_as_you_go([1, '+', 2, '*', 3])
    9
    >>> calc_as_you_go([3, '-', 1])
    2
    >>> calc_as_you_go([2, '*', 3, '+', 4])
    10
    >>> calc_as_you_go([4, '+', 2, '*', 3])
    18
    """

    n = input.pop(0)
    while input:
        op = input.pop(0)
        arg = input.pop(0)
        n = apply_op(op, n, arg)
    return n


# FULL RPN Calculator (uses stack)
def calc_rpn(input):
    """
    >>> calc_rpn([1, 2, '+'])
    3
    >>> calc_rpn([2, 3, '+', 4, '*'])
    20
    >>> calc_rpn([2, 3, 4, '+', '*'])
    14
    """

    stack = []
    for x in input:
        if isinstance(x, str):
            arg2 = stack.pop()
            arg1 = stack.pop()
            n = apply_op(x, arg1, arg2)
            stack.append(n)
        else:
            stack.append(x)
    return stack[0]


# FULL TREE-WALKING INFIX CALCULATOR
def eval_tree(tree_or_number):
    """
    >>> eval_tree([2, '*', [3, '+', 4]])
    14
    """
    if isinstance(tree_or_number, list):
        left_expr, op, right_expr = tree_or_number
        # recursively evaluate left and right children
        left, right = eval_tree(left_expr), eval_tree(right_expr)
        if op == '+':                   # NOTE:  could use apply-op here
            return left + right
        elif op == '-':
            return left - right
        elif op == '*':
            return left * right
        elif op == '/':
            return left / right
    else:
        return tree_or_number

def parse_parens(input):
    tree = []
    while input:
        token = input.pop(0)
        if token == '(':
            tree.append(parse_parens(input))
        elif token == ')':
            return tree
        else:
            tree.append(token)
    return tree

def eval_parens(input):
    """
    >>> eval_parens([2, '*', '(', 3, '+', 4, ')'])
    14
    """

    return eval_tree(parse_parens(input))
