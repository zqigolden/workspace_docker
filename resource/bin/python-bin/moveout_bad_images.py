from pathlib import Path
import sys
import PIL
from PIL import Image
for img in Path(sys.argv[-1]).rglob('*jpg'):
    try:
        Image.open(str(img)).load()
    except PIL.UnidentifiedImageError:
        print(img)
        (img.parent / '../bad_img').mkdir(exist_ok=True)
        img.rename(img.parent / '../bad_img' / img.name)

