#%%
def loadFileInput(filename):
#return string array with all of lines in input.txt
    arrInput = []
    try:
        fileInput = open(filename, 'r')
        for line in fileInput:
            arrInput.append(line)
    finally:
        fileInput.close()
    return arrInput