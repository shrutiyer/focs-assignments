# Course: ENGR3520
# Author: Oliver Steele
# Date: 2016-10-01

def apply_op(op, a, b):
    """Helper function to actually do the arithmetic."""
    import operator
    ops = {'+': operator.add, '-': operator.sub, '*': operator.mul}
    return ops[op](a, b)

#############################################
## infix as-you-go calculator
## uses a helper function after the first token is read

# This could also be a nested function inside of calc_as_you_go.
# We avoided that, to avoid introducing nested functions in the Scheme translation this early in the course.
def calc_as_you_go_helper(arg1, token):
    """Helper function for calc_as_you_go."""
    if token:
        return calc_as_you_go_helper(apply_op(token[0], arg1, token[1]), token[2:])
    else:
        return arg1

def calc_as_you_go(token):
    """Infix as-you-go calculator.

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

    return calc_as_you_go_helper(token[0], token[1:])

#############################################
## Full RPN calculator
## uses a helper function after the first token is read

def calc_rpn_helper(token, stack):
    """Helper function for calc_rpn."""
    if not token:
        return stack[0]
    elif isinstance(token[0], int):
        return calc_rpn_helper(token[1:], [token[0]] + stack)
    else:
        return calc_rpn_helper(token[1:], [apply_op(token[0], stack[1], stack[0])] + stack[2:])

def calc_rpn(token):
    """Full RPN Calculator.

    >>> calc_rpn([1, 2, '+'])
    3
    >>> calc_rpn([2, 3, '+', 4, '*'])
    20
    >>> calc_rpn([2, 3, 4, '+', '*'])
    14
    """

    return calc_rpn_helper(token, [])
