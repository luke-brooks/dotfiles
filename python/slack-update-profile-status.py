import pip._vendor.requests
import time
import json
import random

url = 'https://bluesight.slack.com/api/users.profile.set'

mySuperSecretToken = 'none-of-your-beeswax'
mySuperSecretCookie = 'hands-off-my-cookies'

expiration = time.time() + 300 # add 5 minutes to life of status, ends up closer to 3 minutes when accounting for deliver & processing delays

headers = {'cookie': mySuperSecretCookie}

quotes = [
    "xxx420xBLAZExITxxx", # every 13yo's gamertag in 2008
    "Dave's not here, man.", # cheech and chong
    "Drugs are bad mmkay.", # south park
    "This is, like, the apex of the vortex of joint engineering.", # pineapple express
    "If you were yogurt, would you be fruit at the bottom or stirred?", # bio-dome
]
rand_int = random.randint(0, len(quotes))
random_quote = quotes[rand_int]

profile = { "status_emoji": ":blunt_parrot:", "status_expiration": expiration, "status_text": random_quote, "status_text_canonical": "" }
profileJson = json.dumps(profile)

# https://stackoverflow.com/a/12385661/8677309
session = pip._vendor.requests.Session()
response = session.post(url, headers=headers, files=(('profile', (None, profileJson)), ('token', (None, mySuperSecretToken))))

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
