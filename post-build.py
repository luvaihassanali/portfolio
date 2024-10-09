#!/usr/bin/env python3
import os
import sys
from pathlib import Path

root = os.getcwd()
os.chdir(root)

file = Path('C:\\Users\\luv\\source\\repos\\portfolio\\index.html')
file.write_text(file.read_text().replace('<source src=', '<source data-src='))
file.write_text(file.read_text().replace('lazy" src', 'lazy" data-src'))
file.write_text(file.read_text().replace('<video class', '<video playsinline="" class'))
#file.write_text(file.read_text().replace('script.min.js', 'index.js'))
#file.write_text(file.read_text().replace('''</script>
#</head>''', '</script></head>'))

file = Path('C:\\Users\\luv\\source\\repos\\portfolio\\cv\\cv.html')
file.write_text(file.read_text().replace('<script src="../assets/js/index.js"></script>', ''))
#file.write_text(file.read_text().replace('''</script>
#</head>''', '</script></head>'))


file = Path('C:\\Users\\luv\\source\\repos\\portfolio\\cv\\cv1.html')
file.write_text(file.read_text().replace('<script src="../assets/js/index.js"></script>', ''))
#file.write_text(file.read_text().replace('''</script>
#</head>''', '</script></head>'))