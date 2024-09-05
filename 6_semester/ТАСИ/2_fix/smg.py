q = int(input())

users = {}
pages = [0 for i in range(42195)]
user_count = 0

def parse(command):
    if 'RUN' in command:
        args = command.split(' ')
        user = int(args[1])
        page = int(args[2])
        run(user, page)
    if 'CHEER' in command:
        args = command.split(' ')
        user = int(args[1])
        cheer(user)

def run(user, page):
    global user_count
    user_page = users.pop(user, None)
    users[user] = page
    initial_page = 0
    if user_page is None:
        user_count = user_count + 1
    if user_page is not None:
        initial_page = user_page + 1
    for i in range(initial_page, page+1):
        pages[i] = pages[i] + 1
    
def cheer(user):
    print(1 - (pages[users[user]] - 1) / (user_count - 1))

for i in range(100000):
    parse(f"RUN {i} 42190")