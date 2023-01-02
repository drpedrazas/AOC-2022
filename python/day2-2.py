shape_score = {'A':1, 'B': 2, 'C': 3}
answer = {'X':{'A':'C', 'B': 'A', 'C': 'B'},
            'Y':{'A':'A','B':'B', 'C': 'C'},
            'Z':{'A': 'B','B': 'C', 'C': 'A'}}
result_score = {'X':0, 'Y':3, 'Z':6}
def score_encounter(opponent, player):
    return shape_score[answer[player][opponent]] + result_score[player] 
file = open('day2_data','r')
total = 0
for encounter in file.readlines():
    total += score_encounter(*encounter[:-1].split(" "))
print(total)
