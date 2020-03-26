#%%
from Tools import *
from Algorithm import *
from Utils import *

def main(inputFilename,outputFilename):
    arrInput=loadFileInput(inputFilename)
    alpha=arrInput[0]
    KB=arrInput[2:]
    KB=[item.replace("\n","") for item in KB]
    result=pl_resolution(KB, alpha,outputFilename)

#%%
main("input1.txt","output1.txt")

# %%
main("input2.txt","output2.txt")

# %%
main("input3.txt","output3.txt")

# %%
main("input4.txt","output4.txt")


# %%
main("input5.txt","output5.txt")



# %%
main("input6.txt","output6.txt")


# %%
