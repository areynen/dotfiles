#!/usr/bin/env python3
import requests
import json
import re
import os
import sys
from pathlib import Path

def downloader(url):
    req = requests.get(url)
    # print(req.text)

    regex_pages = r"\"pages\":\[.*\],\"key\""
    matches_pages = re.search(regex_pages, req.text)
    match_pages = matches_pages.group(0)
    pages_list = match_pages.replace(
        "],\"key\"", "").replace("\"pages\":[", "").split(",")


    regex_title = r"[^\"]* - [^\"]* - CatManga"
    matches_title = re.search(regex_title, req.text)
    match_title = matches_title.group(0)
    title = (match_title.split(" - ")[1])
    chapter = (match_title.split(" - ")[0].replace("Chapter ", "")) if "Chapter" in match_title else 0

    try:
        chapter_path = os.path.join(
            Path.home(), "Manga", title, f"c{format(int(chapter), '03d')}")
    except:
        digits = chapter.split(".")[1]
        chapter_path = os.path.join(
            Path.home(), "Manga", title, f"c{format(float(chapter), '05.1f')}")

    if not os.path.exists(chapter_path):
        os.makedirs(chapter_path)

    print(f"Downloading chapter {chapter}...")
    sys.stderr.write(chapter_path)

    for i, url in enumerate(pages_list):
        image_file = chapter_path + "/" + format((i+1), '03d')+".png"
        headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',
                   'Referer': 'https://manga4life.com/'}
        r = requests.get(url.replace("\"", ""), headers=headers)
        if r.status_code == 200:
            with open(image_file, 'wb') as f:
                f.write(r.content)
        else:
            print("Encountered Error {} when downloading.".format(r.status_code))

        print(" Downloaded page {}.".format(i+1))


if __name__ == "__main__":
    url = sys.argv[1]
    # url = "https://catmanga.org/series/komi/327"
    downloader(url)
