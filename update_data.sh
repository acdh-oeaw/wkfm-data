# bin/bash

echo "download fresh data from transkribus"
./download.sh

echo "running some postprocessing with fetch-data.xml"
ant -f fetch-data.xml

echo "delete line zones"
python delete_line_zones.py

echo "add xml:id, prev and next attributes"
add-attributes -g "./data/editions/*.xml" -b "https://id.acdh.oeaw.ac.at/wkfm"

echo "writing prev/next"
find ./data/editions/ -type f -name "*.xml"  -print0 | xargs -0 sed -i 's@continued="true"@subtype="continued"@g'
