#!/bin/bash
git add README.md
git add */README.md
git add */*/*.md
git add gendocs.sh
git commit -m 'sync local to upstream'
git push origin
