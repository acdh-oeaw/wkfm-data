# wkfm-data

Daten Repo für das FWF-Projekt [Prosopographie der Wiener Kaufmannschaft (1725-1758)](https://pf.fwf.ac.at/de/wissenschaft-konkret/project-finder/40288)

## ToC

### `download.sh`
* Downloads Transkribus Export from defined `$DL_URL` (TEI-Output with XSLT from Dario Kampkaspar), unzipps and stores them as `./data/trnsk/{col-id}.xml`. Be aware that any already existing files in this directory will be deleted first.
* needs to be run only if you'd like to update from Transkribus

### `process_images`

* copies/flattens images in a single directory and compresses them
* mainly kept for legacy reasons


### `build.xml`

* process and copy files from `./data/transk` into `./data/editions`

### `dl_fundament.sh` and `dl_staticsearch.sh`

* download and set up [Fundament]() and [staticSearch]()
* run those scripts if you plan to develop locally
* used by `.github/workflows/build.yml`