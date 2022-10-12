a = [1, 2, 3, 4]
b = [sum(a[0:x+1]) for x in range(0, len(a))]
print(b)

array1 = [1, 2, 3, 4, 5]
arrav2 = array1
arrav2[0] = 0
print(array1)

import re
res = re.findall('welcome to Turning', 'welcome', 1)
print(res)

print([i.lower() for i in "TURING"])