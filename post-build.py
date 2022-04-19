#!/usr/bin/env python3
import os
import sys
from pathlib import Path

root = sys.argv[1]
os.chdir(root)
os.rename('assets/js/script.min.js', 'assets/js/index.js')

file = Path('index.html')
file.write_text(file.read_text().replace('<source src=', '<source data-src='))
file.write_text(file.read_text().replace('lazy" src', 'lazy" data-src'))
file.write_text(file.read_text().replace('<video class', '<video playsinline="" class'))
file.write_text(file.read_text().replace('script.min.js', 'index.js'))