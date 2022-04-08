# bin/bash
DL_URL="https://transkribus.eu/export/1539012211444795816/export_job_2909949.zip"
echo "Downloading Documents from $DL_URL"
IFS='/' read -r -a array <<< "$DL_URL"
JOB_ID=${array[-1]}
rm $JOB_ID

TMP=$"./tmp"
TRNSK=$"./data/trnsk"
rm -rf $TMP
rm -rf $TRNSK
mkdir -p $TMP
mkdir -p $TRNSK
wget $DL_URL && unzip $JOB_ID -d $TMP

for f in $TMP/*/*.xml;
do
    IFS='/' read -r -a array <<< "$f"
    COL_ID=${array[-2]}
    FNAME=$(basename $f)
    echo "copy $f to ${TRNSK}/${COL_ID}.xml"
    cp -- "$f" "${TRNSK}/${COL_ID}.xml"
done

rm $JOB_ID
rm -rf $TMP