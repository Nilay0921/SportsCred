import requests

def is_valid_email(email):
    response = requests.get("https://isitarealemail.com/api/email/validate", params = {'email': email})

    status = response.json()['status']
    if status == "valid":
        print("email is valid")
    elif status == "invalid":
        print("email is invalid")
    else:
        print("email was unknown")
        
is_valid_email("pandyamalhar2000@gmail.com")
is_valid_email("pandyamalhar2001@gmail.com")