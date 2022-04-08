import glob
import os
from tqdm import tqdm
from acdh_tei_pyutils.tei import TeiReader

files = glob.glob('./data/editions/*.xml')

for x in tqdm(files):
    doc = TeiReader(x)
    for bad in doc.any_xpath('.//tei:zone[@rendition="Line"]'):
        bad.getparent().remove(bad)
    new_name = x.replace('editions/', 'editions/wkfm-')
    doc.tree_to_file(new_name)
    os.remove(x)