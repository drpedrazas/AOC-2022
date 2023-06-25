with open("day7.txt") as file:
    commands = [command.strip() for command in file.readlines()]

directories = {'/home': 0}
path = '/home'

for command in commands:

    if command[2:4] == 'cd':

        if command[5:] != '..':

            if command[5:] == '/':

                path = '/home'

            else:

                path = path + '/' + command[5:]

                if path not in directories:

                    directories[path] = 0
        else:

            path = path[:path.rfind('/')]


    elif command[:3] != 'dir' and command[:4] != '$ ls':
        
        size = int(command.split(' ')[0])
        
        curr = path

        for i in range(path.count('/')):

            directories[curr] += size

            curr = curr[:curr.rfind("/")]

total = sum([directories[i] for i in  directories if directories[i] <= 100000])

print("Solution part I:", total)

available = 70000000 - directories['/home']

ordered = sorted([i for i in directories if directories[i] + available >= 30000000], key=lambda x: directories[x])

print("Solution part II:" ,directories[ordered[0]])
