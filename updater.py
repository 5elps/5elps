import os
import shutil
import requests
from zipfile import ZipFile

# GitHub repository details
repo_url = 'https://github.com/5elps/5elps'
api_url = 'https://api.github.com/repos/5elps/5elps/releases/latest'
headers = {'Accept': 'application/vnd.github.v3+json'}

# Function to download and extract latest release
def download_and_extract_latest_release():
    try:
        # Fetch latest release information
        response = requests.get(api_url, headers=headers)
        if response.status_code == 200:
            release_info = response.json()
            zip_url = release_info['zipball_url']

            # Download the ZIP file of the latest release
            zip_response = requests.get(zip_url)
            if zip_response.status_code == 200:
                with open('latest_release.zip', 'wb') as f:
                    f.write(zip_response.content)
                
                # Extract the ZIP file
                with ZipFile('latest_release.zip', 'r') as zip_ref:
                    zip_ref.extractall('temp_extracted')
                
                # Clean up
                os.remove('latest_release.zip')

                # Copy extracted files to your target directory (replace as needed)
                source_dir = 'temp_extracted/' + os.listdir('temp_extracted')[0]
                target_dir = './'  # Replace with your actual target directory

                for item in os.listdir(source_dir):
                    source = os.path.join(source_dir, item)
                    if os.path.isfile(source):
                        shutil.copy(source, target_dir)
                    elif os.path.isdir(source):
                        shutil.copytree(source, os.path.join(target_dir, item))
                
                # Clean up temporary extracted directory
                shutil.rmtree('temp_extracted')

                print('Update successful!')
            else:
                print(f'Failed to download latest release ZIP (Status code: {zip_response.status_code})')
        else:
            print(f'Failed to fetch latest release information (Status code: {response.status_code})')
    except Exception as e:
        print(f'Error: {str(e)}')

if __name__ == '__main__':
    download_and_extract_latest_release()
