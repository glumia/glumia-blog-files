+++
date = "2019-08-21"
tags = ["python", "scripting"]
title = "GOG Store - Overkill search"
+++

![image](/blog/gog-store-overkill-search/gogemail.png)

I had 1.30 euro remaining on my GOG wallet and I had to use them before Sept. 19 or they
would expire. I started to look for a game but store's search engine didn't allow me to
filter them for a price in a custom range. I could only search for games whose
price was less than 5 euros, and this still yield to 530 results. Too many to
check them one by one. Given that I'm lazy I worked my way out to automate the search
using the GOG API and a simple Python script.

After a quick look at https://gogapidocs.readthedocs.io/en/latest I came to this bash
command to get all the games whose price was less than 5€:
```bash
for i in {1..12}; do
	curl \
		-H "Accept: application/json" \
		-H "Content-Type: application/json" \
		"https://embed.gog.com/games/ajax/filtered?mediaType=game&price=u5&sort=bestselling&page=$i" \
		> "games$i.json" ;
done
```

Then I wrote this python script to process the data and (eventually) get the games I was
searching for:
```python
import json

import requests

# Merge JSON data in a single list
data = []
for i in range(1, 13):
    with open("games" + str(i) + ".json", "r") as fp:
        tmp = json.load(fp)
        data = data + tmp["products"]

# Filter - Price <= 1.30 and Price > 0
data = [
    x
    for x in data
    if float(x["price"]["finalAmount"]) <= 1.3 and float(x["price"]["finalAmount"]) > 0
]

# Filter - Remove DLCs
gog_url = "https://www.gog.com"
DLC_flag_text = "To play this game you also need"
data = [x for x in data if DLC_flag_text not in requests.get(gog_url + x["url"]).text]

if len(data) == 0:
    print("No games in the [0.01, 1.30] price range!")
    exit

for el in data:
    print(el["title"] + "\tPrice: " + el["price"]["finalAmount"])
``` 

Unfortunately, the search wasn't successful and after 1 and half hour I'm still with
1.30 euros on my wallet and nothing to buy. I suppose I'll have to add some funds to
make them valid indefinitely.

PS: Yes, I know, checking manually the 530 results would have taken less time, but
tinkering with APIs and code is definitively more fun.
