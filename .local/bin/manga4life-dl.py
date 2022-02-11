#!/usr/bin/env python3
import requests
import json
import re
import os
import sys
from pathlib import Path


def pad_filename(str):
    digits = re.compile('(\\d+)')
    pos = digits.search(str)
    if pos:
        return str[1:pos.start()] + pos.group(1).zfill(3) + str[pos.end():]
    else:
        return str


def downloader(url):
    req = requests.get(url)
    # Write some kind of checking system here, idk
    cur_chapter = json.loads(
        re.search(r"vm\.CurChapter = (.*);", req.text).group(1))
    full_title = re.search(
        r"<meta property=\"og:title\" content=\"(.*) Page 1\"", req.text).group(1)

    title = full_title.split("Chapter")[-2].strip()
    chapter = full_title.split("Chapter")[-1].strip()
    print(f"Downloading chapter {chapter}...")

    try:
        chapter_path = os.path.join(
            Path.home(), "Manga", title, f"c{format(int(chapter), '03d')}")
    except:
        digits = chapter.split(".")[1]
        chapter_path = os.path.join(
            Path.home(), "Manga", title, f"c{format(float(chapter), '05.1f')}")


    cur_pathname = re.search(r"vm.CurPathName = \"(.*)\"", req.text).group(1)
    index_name = re.search(r"vm.IndexName = \"(.*)\"", req.text).group(1)
    image_url_prefix = "https://"+cur_pathname+"/manga/"+index_name+"/"
    image_url_prefix += "" if cur_chapter["Directory"] == "" else cur_chapter["Directory"]+"/"
    image_url_prefix += cur_chapter["Chapter"][1:len(cur_chapter["Chapter"])-1]

    if(cur_chapter["Chapter"][-1] != "0"):
        image_url_prefix += "."+cur_chapter["Chapter"][-1]

    image_url_prefix += "-"
    # print(image_url_prefix)
    chapter_n_pages = int(cur_chapter["Page"])
    sys.stderr.write(chapter_path)

    if not os.path.exists(chapter_path):
        os.makedirs(chapter_path)

    for i in range(1, chapter_n_pages+1):
        page = str(i).rjust(3, "0")
        image_url = image_url_prefix + page + ".png"
        image_file = chapter_path + "/" + format((i), '03d')+".png"
        headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',
                   'Referer': 'https://manga4life.com/'}
        r = requests.get(image_url, headers=headers)
        if r.status_code == 200:
            with open(image_file, 'wb') as f:
                f.write(r.content)
        else:
            print("Encountered Error {} when downloading.".format(r.status_code))

        print(" Downloaded page {}.".format(i))


if __name__ == "__main__":
    url = sys.argv[1]
    downloader(url)
    # for i in range(1,18):
    #    url = f"https://manga4life.com/read-online/i-tell-c-chapter-{i}-page-1.html"
    #    print(url)
    #    downloader(url)
