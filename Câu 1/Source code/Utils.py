#%%
def dissociate(op, args):
    """Tách mệnh đề args thành các literal hoặc mệnh đề nhỏ hơn, dựa vào toán tử op
    Ex: dissociate('AND', [A AND B]) --> [A, B]
        dissociate('AND', [A OR B]) --> [(A OR B)]
        dissociate('OR', [A AND B]) --> [(A AND B)]
        dissociate('OR', [A OR B]) --> [A, B]
    """
    result = args.split(op)
    result = [item.strip() for item in result]
    return result

def associate(op, args):
    """Gộp list literal hoặc mệnh đề nhỏ thành 1 mệnh đề lớn, dựa vào toán tử op
    Ex: associate("AND", [(A AND B),(B OR C),(B AND C)]) --> (A AND B AND (B OR C) AND B AND C)
        associate("OR", [A OR (B OR (C OR (A AND B)))]) --> (A OR B OR C OR (A AND B))
    """
    if len(args) == 0:
        return str('{}')
    elif len(args) == 1:
        return args[0]
    else:
        result=args[-1]
        for i in range(len(args)-2,-1,-1):
            result=result+" OR "+args[i]
        return result



def conjuncts(s):
    """Return a list of the conjuncts in the sentence s."""
    return dissociate("AND", s)


def disjuncts(s):
    """Return a list of the disjuncts in the sentence s."""
    return dissociate("OR", s)

#Phủ định literal
def invertSingleLiteral(x):
    if len(x)==1:
        return "-"+x
    elif len(x)==2:
        return x[1]

#Phủ định alpha
def invertAlpha(alpha):
    result=disjuncts(alpha)
    return [invertSingleLiteral(item) for item in result]

def isEqualNegative(a,b):
    if len(a)==len(b): return False
    else:
        if len(a)==2: return a[1]==b
        else: return b[1]==a

#%%
def unique(seq):
    """Make every element be unique --> Delete duplicate elements of a seq"""
    return list(set(seq))

def removeDup(item, seq):
    """Return a copy of seq that was removed its elements which are equal to item."""
    return [x for x in seq if x != item]

def removeDupInClause(inpList, Clauses):
    for i in Clauses[:]:
        if i in inpList:
            inpList.remove(i)

# %%
def findNegative(clauses):
    n=len(clauses)
    pairs = [(clauses[i], clauses[j]) for i in range(n) for j in range(i+1, n)]
    for (ci, cj) in pairs:
        if isEqualNegative(ci,cj): return True
    return False

# %%
