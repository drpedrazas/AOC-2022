shape_score = {'X':1, 'Y': 2, 'Z': 3}
shpa_score_enemy = {'A':1, 'B':2, 'C':3}
matches = {'X':{'A':3, 'B':0, 'C': 6},
            'Y':{'A':6,'B':3, 'C': 0},
            'Z':{'A':0,'B':6, 'C':3}}
def score_encounter(opponent, player):
    return matches[player][opponent] + shape_score[player]
file = open('day2_data','r')
total = 0
for encounter in file.readlines():
    total += score_encounter(*encounter[:-1].split(" "))
print(total)
