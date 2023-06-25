f = open("input",'r')
words = f.readlines()
ans = list()
alphabet = [chr(i) for i in range(97, 97+26)] + [chr(i) for i in range(65, 65+26)]

def compare(x,y):
    letters_y = [0 for _ in alphabet]
    letters_x = [0 for _ in alphabet]
    for i in y:
        for index, p in enumerate(alphabet):
            if p == i:
                letters_y[index] = 1
                break
    for i in x:
        for index, p in enumerate(alphabet):
            if p == i:
                letters_x[index] = 1
                break
    common = [i*j for i,j in zip(letters_y, letters_x)]
    return sum([i*j for i,j in enumerate(common)])
for w in words:
    half = int(len(w) / 2)
    comp1 = w[:half]
    comp2 = w[half:]
    index = compare(comp1,comp2)
    ans.append(index+1)
print(sum(ans))
