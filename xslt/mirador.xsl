<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html lang="en"  xmlns="http://www.w3.org/1999/xhtml">
            
            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>WKFM-Faksimiles</title>
                <script src="https://unpkg.com/mirador@latest/dist/mirador.min.js"></script>
            </head>
            
            <body>
                <div id="my-mirador"></div>
                
                <script>
                    var mirador = Mirador.viewer({
                    "id": "my-mirador",
                    "manifests": {
                    "js/manifest.json": {
                    "provider": "ACDH-CH"
                    }
                    },
                    "windows": [{
                    "loadedManifest": "js/manifest.json",
                    "canvasIndex": 0,
                    "thumbnailNavigationPosition": 'far-bottom'
                    }]
                    });
                </script>
            </body>
            
        </html>
    </xsl:template>
</xsl:stylesheet>