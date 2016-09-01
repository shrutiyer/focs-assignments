# Course: ENGR3520
# Author: Oliver Steele
# Date: 2016-10-01

def apply_op(op, a, b):
    import operator
    ops = {'+': operator.add, '-': operator.sub, '*': operator.mul}
    return ops[op](a, b)

def calc_as_you_go_helper(arg1, input):
    if input:
        return calc_as_you_go_helper(apply_op(input[0], arg1, input[1]), input[2:])
    else:
        return arg1

def calc_as_you_go(input):
    """
    >>> calc_as_you_go([1, '+', 2, '*', 3])
    9
    >>> calc_as_you_go([1, '+', 2, '*', 3])
    9
    >>> calc_as_you_go([3, '-', 1])
    2
    >>> calc_as_you_go([2, '*', 3, '+', 4])
    10
    >>> calc_as_you_go([4, '+', 2, '*', 3])
    18
    """

    return calc_as_you_go_helper(input[0], input[1:])

def calc_rpn_helper(input, stack):
    if not input:
        return stack[0]
    elif isinstance(input[0], int):
        return calc_rpn_helper(input[1:], [input[0]] + stack)
    else:
        return calc_rpn_helper(input[1:], [apply_op(input[0], stack[1], stack[0])] + stack[2:])

def calc_rpn(input):
    """
    >>> calc_rpn([1, 2, '+'])
    3
    >>> calc_rpn([2, 3, '+', 4, '*'])
    20
    >>> calc_rpn([2, 3, 4, '+', '*'])
    14
    """

    return calc_rpn_helper(input, [])
