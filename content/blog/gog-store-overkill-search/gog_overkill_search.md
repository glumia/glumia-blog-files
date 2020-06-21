+++
date = "2019-08-21"
tags = ["python", "scripting"]
title = "GOG Store - Overkill search"
+++

![image](/blog/gog-store-overkill-search/gogemail.png)

I had 1.30 euro remaining on my GOG wallet and I had to use them before sept. 19 or I would lose them. So I started to search on the GOG Store for a game whose price would be less or equal to 1.30 euro and greater than 0€ (since I wasn't searching a free game...) but the default filters of the website's search engine allowed me to filter only games whose price was less than 5€.
Given that they where still 530 results and that I'm a very lazy person I worked my way out to automate the search using the GOG API and a simple Python script.

After a quick look at https://gogapidocs.readthedocs.io/en/latest I came to this bash command to get all the games whose price was less than 5€:

    for i in {1..12}; do curl -H "Accept: application/json" -H "Content-Type: application/json" "https://embed.gog.com/games/ajax/filtered?mediaType=game&price=u5&sort=bestselling&page=$i" > games$i.json ; done

Then I wrote this python script to process the data and (eventually) get the games I was searching for:

    import json
    import requests
    
    # Merge JSON data in a single list
    data=[]
    for i in range(1,13):
        fp=open("games"+str(i)+".json","r")
        tmp=json.load(fp)
        data=data+tmp["products"]
        fp.close()
    
    #Filter - Price <= 1.30 and Price > 0 
    data=[x for x in data if float(x["price"]["finalAmount"])<=1.3 and \
            float(x["price"]["finalAmount"])>0]
    
    #Filter - Remove DLC's
    gog_url="https://www.gog.com"
    DLC_flag_text="To play this game you also need"
    data=[x for x in data if DLC_flag_text not in \
            requests.get(gog_url+x["url"]).text]
    
    
    if len(data)>0:
        for el in data:
            print(el["title"]+"\tPrice: "+el["price"]["finalAmount"])
    else:
        print("No games in the 0,01-1.30 price range!") 
    


Unfortunately the search wasn't successful and after 1 and half hour I'm still with 1.3 euro on my wallet and nothing to buy. I suppose I'll have to add some funds to make them valid indefinitely.

PS: Yes, I know, checking manually the 530 results would have taken less time... but tinkering with API's and code is definitively more funny.	
