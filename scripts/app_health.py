import requests

URL = "http://localhost:4499"


try:
    response = requests.get(URL, verify=False, timeout=5)
    if response.status_code == 200:
        print(f"Application is UP ✅ (Status Code: {response.status_code})")
    else:
        print(f"Application is DOWN ❌ (Status Code: {response.status_code})")
except requests.exceptions.RequestException as e:
    print(f"Application is DOWN ❌ (Error: {e})")

