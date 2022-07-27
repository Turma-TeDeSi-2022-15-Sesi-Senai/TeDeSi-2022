l = []
while True:
    s = input()
    if not s:
        break
    l.append(tuple(s.split(",")))
    
print(sorted(l, key=lambda x: x[1]))