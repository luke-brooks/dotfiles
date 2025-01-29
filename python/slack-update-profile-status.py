import pip._vendor.requests
import time
import json
import random

# print("hi mom")

workingDir = "/Users/LukeBrooks/code/learning-repos/dotfiles/python/"

url = ""
mySuperSecretToken = ""
mySuperSecretCookie = ""

with open(workingDir + "slack-config.txt", "r") as config:
    for line in config:
        print(line.strip())
        parsedLine = json.loads(line.strip())
        print(parsedLine)
        url = parsedLine["url"]
        mySuperSecretToken = parsedLine["token"]
        mySuperSecretCookie = parsedLine["cookie"]


expiration = time.time() + 300 # add 5 minutes to life of status, ends up closer to 3 minutes when accounting for deliver & processing delays

headers = {'cookie': mySuperSecretCookie}

quotes = [
    "xxx420xBLAZExITxxx", # every 13yo's gamertag in 2008
    "Dave's not here, man.", # cheech and chong
    "Drugs are bad mmkay.", # south park
    "This is, like, the apex of the vortex of joint engineering.", # pineapple express
    "If you were yogurt, would you be fruit at the bottom or stirred?", # bio-dome
    "Not my chair, not my problem", # that stoned dude from the old-ass youtube video
]
rand_int = random.randint(0, len(quotes) - 1)
random_quote = quotes[rand_int]

profile = { "status_emoji": ":blunt_parrot:", "status_expiration": expiration, "status_text": random_quote, "status_text_canonical": "" }
profileJson = json.dumps(profile)

# https://stackoverflow.com/a/12385661/8677309
session = pip._vendor.requests.Session()
response = session.post(url, headers=headers, files=(('profile', (None, profileJson)), ('token', (None, mySuperSecretToken))))

# print(response.text) # debug http response

# https://www.jcchouinard.com/python-automation-with-cron-on-mac/#How_to_Schedule_a_Task_With_Cron
# cron schedule (minute hour dayOfMonth month dayOfWeek)
# minute = (0 - 59)
# hour = (0 - 23)
# dayOfMonth = (1 - 31)
# month = (1 - 12)
# dayOfWeek = (0 - 6)

# desired schedules:
# (18 4 * * *)
# (18 16 * * *)

# crontab config
# 18 16 * * * /usr/bin/python3 /Users/LukeBrooks/code/learning-repos/dotfiles/python/slack-update-profile-status.py 
