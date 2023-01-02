with open("day1_data","r") as g:
    lines = g.readlines()

max_cal = [0,0,0]
curr = 0
for u in lines:
    if u != "\n":
        curr += int(u[:-1])
    else:
        if curr > max_cal[0]:
            temp = max_cal[1]
            max_cal[2] = temp
            temp = max_cal[0]
            max_cal[1] = temp
            max_cal[0] = curr
        elif curr > max_cal[1]:
            temp = max_cal[1]
            max_cal[1] = curr
            max_cal[2] = temp
        elif curr > max_cal[2]:
            max_cal[2] = curr
        curr = 0
print(max_cal, sum(max_cal))
