#!/bin/bash
git add README.md
git add */README.md
git add */*/README.md
git commit -m 'sync local to upstream'
git push origin
