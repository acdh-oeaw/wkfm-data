import pandas as pd
import json


IIIF_SERVER_URL = "https://iiif.acdh.oeaw.ac.at/iiif/images/wkfm/"
PROJECT_URI = "https://wkfm"
PROJECT_MD = {
    "@context": "http://iiif.io/api/presentation/3/context.json",
    "id": "https://acdh-oeaw.github.io/wkfm-data/manifest.json",
    "type": "Manifest",
    "label": {
        "de": [
            "Scans: Merkantilprotkoll, WStLA, Einzelstück 2.3.2.B6.1 - Protokoll I | 1725-1758"
        ]
    },
    "license": "CC BY-NC-ND 4.0",
    "attribution": "Wiener Stadt- und Landesarchiv",

    "behavior": [
        "non-paged"
    ],
    "items": []
}
df = pd.read_csv('out.csv')


for i, x in df[df['width'].notna()].iterrows():
    image_id = f"{x['id']}.jp2"
    label = image_id
    item = {
        "id": f"{PROJECT_URI}/canvas/{image_id}",
        "type": "Canvas",
        "label": {
            "en": [
                f"{label}"
            ]
        },
        "height": x['height'],
        "width": x['width'],
        "items": [
            {
                "id": f"{PROJECT_URI}/",
                "type": "AnnotationPage",
                "items": [
                    {
                        "id": f"{PROJECT_URI}/{image_id}",
                        "type": "Annotation",
                        "motivation": "painting",
                        "body": {
                            "id": f"{IIIF_SERVER_URL}{image_id}/full/max/0/default.jpg",
                            "type": "Image",
                            "format": "image/jpeg",
                            "height": x['height'],
                            "width": x['width'],
                            "service": [
                                {
                                    "id": f"{IIIF_SERVER_URL}{image_id}",
                                    "type": "ImageService3",
                                    "profile": "level1"
                                }
                            ]
                        },
                        "target": f"{PROJECT_URI}/canvas/{image_id}"
                    }
                ]
            }
        ]
    }
    PROJECT_MD['items'].append(item)

with open('./html/manifest.json', 'w') as f:
    f.write(json.dumps(PROJECT_MD))
