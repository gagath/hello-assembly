#!/bin/sh

# Verify that we are corrrectly running mold
readelf -p .comment hello | grep mold || exit 1
