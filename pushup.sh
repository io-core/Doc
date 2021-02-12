#!/bin/bash
git add README.md
git add */README.md
git add */*/*.md
git add gendocs.sh
git commit -m 'regenerated'
git push origin
