#!/usr/bin/env python3
import requests
import sys

def download_file_from_google_drive(ID, destination):

    def get_confirm_token(response):
        for key, value in response.cookies.items():
            if key.startswith('download_warning'):
                return value

        return None

    def save_response_content(response, destination):
        CHUNK_SIZE = 32768

        with open(destination, "wb") as f:
            for chunk in response.iter_content(CHUNK_SIZE):
                if chunk: # filter out keep-alive new chunks
                    f.write(chunk)

    URL = "https://docs.google.com/uc?export=download"

    session = requests.Session()

    print("in")
    response = session.get(URL, params = { 'id' : ID, 'confirm': 'no_antivirus' }, stream = True)
    print("Response is:", response)
    token = get_confirm_token(response)
    print("Token is", token)

    if token:
        params = { 'id' : ID, 'confirm' : token }
        response = session.get(URL, params = params, stream = True)

    save_response_content(response, destination)    
if __name__ == "__main__":
    if len(sys.argv) is not 3:
        print ("Usage: python google_drive.py drive_file_id destination_file_path")
    else:
        file_id = sys.argv[1]
        destination = sys.argv[2]
        print(file_id, destination)
        download_file_from_google_drive(file_id, destination)
