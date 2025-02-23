import requests
import json

url = "https://mrtehran.app/playlist/N6rLGdYP8yM2mR8v3QKJo9"

headers = {
    "accept": "text/x-component",
    "accept-language": "en-US,en;q=0.9,fa;q=0.8",
    "content-type": "text/plain;charset=UTF-8",
    "next-action": "a4dc12e0b79f2b172e4c8b433b6222ba2c06317a",
    "next-router-state-tree": "%5B%22%22%2C%7B%22children%22%3A%5B%22playlist%22%2C%7B%22children%22%3A%5B%5B%22playlistId%22%2C%22N6rLGdYP8yM2mR8v3QKJo9%22%2C%22d%22%5D%2C%7B%22children%22%3A%5B%22__PAGE__%22%2C%7B%7D%2C%22%2Fplaylist%2FN6rLGdYP8yM2mR8v3QKJo9%22%2C%22refresh%22%5D%7D%5D%7D%5D%7D%2Cnull%2Cnull%2Ctrue%5D",
    "sec-ch-ua": "\"Not(A:Brand\";v=\"99\", \"Google Chrome\";v=\"133\", \"Chromium\";v=\"133\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Windows\"",
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-origin",
    "sec-gpc": "1"
}

data = json.dumps(["vKPr0bqJmpOYpNQW7OLeYy"])

response = requests.post(url, headers=headers, data=data)

if response.status_code == 200:
    print("Request was successful!")
    print(response.text)  # Or process the response content as needed
else:
    print(f"Request failed with status code: {response.status_code}")
    print(response.text)
