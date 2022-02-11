#!/usr/bin/env python3
import requests
import json
import re
import os
import sys
from pathlib import Path
import time


def downloader(url):
    chapter_id = url.split("/")[-1]
    chapter_req = requests.get("https://api.mangadex.org/chapter/" + chapter_id)
    chapter_json = json.loads(chapter_req.text)
    relationships = chapter_json["data"]["relationships"]
    for i in relationships:
        if i["type"] == "manga":
            manga_id = i["id"]
    try:
        manga_req = requests.get("https://api.mangadex.org/manga/" + manga_id)
    except (UnboundLocalError):
        print("No ID found -- Check the MD API")
        titles = []

    manga_json = json.loads(manga_req.text)
    
    try:
        try:
            title = manga_json["data"]["attributes"]["title"]["en"]
        except:
            title = manga_json["data"]["attributes"]["title"]["jp"]
    except (KeyError):
        print("No EN")
        titles = []
        for i in manga_json["data"]["attributes"]["altTitles"]:
            if str(i).split("'")[1] == "en":
                titles.append((str(i).split("'")[3]))
        try:
            title = min(titles, key=len)
        except (ValueError):
            print("There is no ENGLISH title.")
            exit(0)

    chapter = chapter_json["data"]["attributes"]["chapter"]
    pages = chapter_json["data"]["attributes"]["pages"]

    if chapter is None:
        chapter = chapter_json["data"]["attributes"]["title"]

    at_home_req = requests.get("https://api.mangadex.org/at-home/server/" + chapter_id)
    at_home_json = json.loads(at_home_req.text)
    hash = at_home_json["chapter"]["hash"]
    images = at_home_json["chapter"]["data"]

    try:
        chapter_path = os.path.join(
            Path.home(), "Manga", title, f"c{format(int(chapter), '03d')}")
    except:
        try:
            digits = chapter.split(".")[1]
            chapter_path = os.path.join(
                Path.home(), "Manga", title, f"c{format(float(chapter), '05.1f')}")
        except:
            chapter_path = os.path.join(
                Path.home(), "Manga", title, "One-Shot")

    if os.path.isdir(chapter_path):
        print("The chapter already exists.")
        exit(0)

    print(str(pages) + " Pages")
    if not os.path.exists(chapter_path):
        os.makedirs(chapter_path)

    sys.stderr.write(chapter_path)
    print(f"Downloading chapter {chapter}...")

    for ctr, i in enumerate(images):
        time.sleep (0.25) #abide by MD's limits
        ctr = ctr + 1
        image_url = f"https://uploads.mangadex.org/data/{hash}/{i}"
        image_file = chapter_path + "/" + format((ctr), '03d')+".png"
        r = requests.get(image_url)
        if r.status_code == 200:
            with open(image_file, 'wb') as f:
                f.write(r.content)
        else:
            print("Encountered Error {} when downloading.".format(r.status_code))

        print(" Downloaded page {}.".format(ctr))
    print("Done")

if __name__ == "__main__":
    url = sys.argv[1]
    downloader(url)
