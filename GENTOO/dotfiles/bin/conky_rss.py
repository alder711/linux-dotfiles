#!/usr/bin/env python3

# This script takes an RSS feed and outputs
# the results.

# imports
import feedparser 

# VARIABLES
RSS_SITE = "https://security.gentoo.org/glsa/feed.rss" #'.rss' URL to get feed from

# parse feed
feed = feedparser.parse(RSS_SITE)

# print feed title
#print(feed['feed']['title'])

# print first entry
print(feed['entries'][0]['title'])
