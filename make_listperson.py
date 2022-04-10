import glob
import jinja2
from collections import defaultdict
from acdh_tei_pyutils.tei import TeiReader

files = glob.glob('./data/editions/*.xml')
persons = defaultdict(set)

for x in files:
    doc = TeiReader(x)
    for x in doc.any_xpath('.//tei:rs'):
        try:
            item_id = x.attrib['ref']
        except KeyError:
            continue
        if len(item_id) > 7:
            if "?" in item_id or ',' in item_id or 'u0009' in item_id or 'oder' in item_id:
                continue
            else:
                try:
                    persons[item_id].add(x.text.strip())
                except AttributeError:
                    continue
pers = [[x[0][1:], max(list(x[1]), key=len)] for x in persons.items()]
templateLoader = jinja2.FileSystemLoader(searchpath=".")
templateEnv = jinja2.Environment(loader=templateLoader)
template = templateEnv.get_template('./templates/listperson_template.xml')
with open("./data/indices/listperson.xml", 'w') as f:
    f.write(template.render({"persons": pers}))