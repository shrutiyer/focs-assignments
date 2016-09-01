def apply_op(op, a, b):
    import operator
    ops = {'+': operator.add, '-': operator.sub, '*': operator.mul}
    return ops[op](a, b)

def calc_as_you_go(input):
    """
    >>> calc_as_you_go([1, '+', 2, '*', 3])
    3
    9
    """

    n = input.pop(0)
    while input:
        op = input.pop(0)
        arg = input.pop(0)
        n = apply_op(op, n, arg)
        print n

def rpn_calc(input):
    """
    >>> eval_rpn([1, 2, '+'])
    3
    >>> eval_rpn([2, 3, '+', 4, '*'])
    20
    >>> eval_rpn([2, 3, 4, '+', '*'])
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

def eval_tree(tree_or_number):
    """
    >>> eval_tree([2, '*', [3, '+', 4]])
    14
    """
    if isinstance(tree_or_number, list):
        left_expr, op, right_expr = tree_or_number
        left, right = eval_tree(left_expr), eval_tree(right_expr)
        if op == '+':
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
