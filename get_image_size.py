import glob
import os
import pandas as pd

from PIL import Image

IMG_DIR = os.environ.get('IMG', '')


def yield_img_dict(images):
    for x in images:
        item = {}
        item['id'] = os.path.basename(x).split('.')[0]
        with Image.open(x) as image:
            item['width'], item['height'] = image.width, image.height
        yield item


images = sorted(glob.glob(f"{IMG_DIR}/*.jpg"))
df = pd.DataFrame(yield_img_dict(images), columns=['id', 'width', 'height'])
df.to_csv('out.csv', index=False)
