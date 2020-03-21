#!/usr/bin/python3

"""
This script has been used to download related static files from htmls
and save them in organized profile
### Can not be used in all types of project... need little modification
"""


import os
import re
from urllib.request import urlretrieve
from urllib.parse import urlparse
from pathlib import Path


host = 'https://google.com/'

def download_and_save_file_on_relative_path(url):
    o = urlparse(url)
    if not o.path.lower().endswith(('.html', '.css', '.js')) and o.netloc == '':
        slash_separated = re.search(r'/(.*)/([^/]*)$', o.path)
        if slash_separated:
            to_be_saved_path = os.path.join('images', slash_separated.group(1))
            filename = slash_separated.group(2)
            full_file_path = os.path.join(to_be_saved_path, filename)

            if not os.path.exists(to_be_saved_path):
                # create path if not exists
                Path(to_be_saved_path).mkdir(parents=True, exist_ok=True)
            if not os.path.isfile(full_file_path):
                # download the file if not exists
                print('downloading file: {}'.format(os.path.join(host, url)))
                urlretrieve(os.path.join(host, url), full_file_path)


for f in os.listdir():
    if f.lower().endswith('.html'):
        with open(f, 'r') as f:
            for line in f:
                for i, match in enumerate(re.finditer(r"(src|href)\s*=\s*(?:\'|\")(.+?)(?:\'|\")", line)):
                    url = match.group(2)
                    download_and_save_file_on_relative_path(url)


