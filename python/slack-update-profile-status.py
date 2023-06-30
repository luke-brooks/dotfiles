import requests
import time
import json

url = 'https://bluesight.slack.com/api/users.profile.set'

mySuperSecretToken = 'none-of-your-beeswax'
mySuperSecretCookie = 'hands-off-my-cookies'

expiration = time.time() + 300 # add 5 minutes to life of status, ends up closer to 3 minutes when accounting for deliver & processing delays

print('expiration')
print(expiration)

headers = {'cookie': mySuperSecretCookie}

profile = { "status_emoji": ":blunt_parrot:", "status_expiration": expiration, "status_text": "xXx420xBLAZExITxXx", "status_text_canonical": "" }
profileJson = json.dumps(profile)

# https://stackoverflow.com/a/12385661/8677309
session = requests.Session()
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
