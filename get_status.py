import requests
import json

#using cisco sandbox device
router = {"ip": "ios-xe-mgmt.cisco.com", "port": "9443",
          "user": "root", "password": "D_Vay!_10&"}

#headers
headers = {"Accept": "application/yang-data+json",
           "Content-Type": "application/yang-data+json"}

url = f"https://{router['ip']}:{router['port']}/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces"
# print(url)

response = requests.get(url, headers=headers, auth=(
    router['user'], router['password']), verify=False)

#output status of all interfaces on device
api_data = response.json()
print("/" * 55)
print(api_data["Cisco-IOS-XE-interfaces-oper:interface"]["description"])
print("/" * 55)
if api_data["Cisco-IOS-XE-interfaces-oper:interface"]["admin-status"] == 'if-state-up':
    print('Interface is up')
else:
    print('Interface is down')
