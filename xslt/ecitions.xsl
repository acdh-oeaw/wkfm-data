<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    
    <xsl:import href="nav_bar.xsl"/>
    
    <xsl:template match="/">
        <html >
            <head>
                <title><xsl:value-of select="//tei:title[@level='main']"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/openseadragon.min.js" integrity="sha512-qvQYH6mPuE46uFcWLI8BdGaJpB5taX4lltbSIw5GF4iODh2xIgyz5ii1WpuzPFUknHCps0mi4mFGR44bjdZlZg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <div class="container">
                    <h1>
                        <xsl:value-of select="//tei:title[@type='main']"/>
                    </h1>
                    <xsl:for-each select="//tei:text//tei:ab">
                        <xsl:variable name="counter" select="concat('curNum__', position())"></xsl:variable>
                        <div class="card">
                            <div class="card-header">
                                Seitenzahl
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card">
                                            <div class="body">
                                                <xsl:apply-templates select="."/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card">
                                            <div class="body">
                                                <div style="width:400px; height:600px">
                                                    <xsl:attribute name="id">
                                                        <xsl:value-of select="concat('img', $counter)"/>
                                                    </xsl:attribute>
                                                </div>
                                                
                                                <script type="text/javascript">
                                                    var source = "https://iiif.acdh.oeaw.ac.at/wkfm/Merkantil_und_Wechselgericht_Merkantilprotokoll_1_Reihe__Reihe_1_7_Protokoll_1_0669/info.json";
                                                    OpenSeadragon({
                                                        id: "<xsl:value-of select="concat('img', $counter)"/>",
                                                        tileSources: [
                                                            source
                                                        ],
                                                        sequence: true,
                                                        prefixUrl:"https://cdnjs.cloudflare.com/ajax/libs/openseadragon/2.4.2/images/"
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"  />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:pb">
        <hr/>
    </xsl:template>
    
    <xsl:template match="tei:lb">
        <xsl:apply-templates/><br/>
    </xsl:template>
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="tei:rs">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
</xsl:stylesheet>