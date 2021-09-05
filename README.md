# wkfm-data

Daten Repo für das FWF-Projekt [Prosopographie der Wiener Kaufmannschaft (1725-1758)](https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder/40288)

## ToC

### `download.sh`
Downloads Transkribus Export from defined `$DL_URL` (TEI-Output with XSLT from Dario Kampkaspar), unzipps and stores them as `./data/trnsk/{col-id}.xml`. Be aware that any already existing files in this directory will be deleted first.

### `build.xml`

ToDo
* process and copy files from `./data/transk` into `./data/edtiions`
