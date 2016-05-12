from GE import GE
import numpy as np

A = [[21,67,88,73],
     [76,63,7,20],
     [0,85,56,54],
     [19.3,43,30.2,29.4]]
b = [[141],[109],[218],[93.7]]

print(GE(A,b).get_sol())
print(GE(A,b).get_U())