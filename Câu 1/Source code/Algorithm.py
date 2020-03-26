
#%%
from Utils import *
def pl_resolve(ci, cj):
    """Return all clauses resolved by ci and cj (resolving can result in multi cases)"""
    clauses = []
    for di in disjuncts(ci):
        for dj in disjuncts(cj):
            if (isEqualNegative(di,dj)):
                dnew = unique(removeDup(di, disjuncts(ci)) + removeDup(dj, disjuncts(cj)))
                if findNegative(dnew): continue
                clauses.append(associate("OR", dnew))
    return clauses

#%%
def pl_resolution(KB, alpha, outputFilename):
    """return True if alpha follows from KB"""
    outF = open(outputFilename, "w")
    clauses = KB + invertAlpha(alpha)
    while True:
        new = []
        n = len(clauses)
        pairs = [(clauses[i], clauses[j]) for i in range(n) for j in range(i+1, n)]
        for (ci, cj) in pairs:
            resolvents = pl_resolve(ci, cj)
            removeDupInClause(resolvents,new)
            removeDupInClause(resolvents,clauses)
            if len(resolvents)>0:
                new.extend(resolvents)

        length=len(new)
        outF.write(str(length))
        outF.write("\n")
        if (length==0):
            outF.write("NO")
            outF.close()
            return False
        
        for i in new:
            outF.write(str(i))
            outF.write("\n")               
        if '{}' in new:
            outF.write("YES")
            outF.close()
            return True
        clauses.extend(new)

# %%
