<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml"
    version="2.0">
    <!--    with support from https://github.com/dariok -->
    <xsl:import href="nav_bar.xsl"/>
    <xsl:variable name="iiif_server" select="'https://iiif.acdh.oeaw.ac.at/wkfm/'"/>
    
    <xsl:template match="/">
        <html >
            <head>
                <title><xsl:value-of select="//tei:title[@level='main']"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
                <link rel="stylesheet" href="css/style.css" />
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
                        <xsl:variable name="facs_id" select="substring-after(data(./preceding::tei:pb[1]/@facs), '#')"/>
                        <xsl:variable name="page_nr" select="data(./preceding::tei:pb[1]/@n)"/>
                        <xsl:variable name="facs_el" select="id($facs_id)" as="node()"/>
                        <xsl:variable name="img_id" select="substring-before(data($facs_el//@url), '.jpg')"/>
                        <xsl:variable name="iiif_json" select="concat($iiif_server, $img_id, '/info.json')"/>
                        <div class="card">
                            <div class="card-header">
                                <!--facs_id: <xsl:value-of select="$facs_id"/><br/>
                                img_id: <xsl:value-of select="$img_id"/><br/>
                                iiif_json: <xsl:value-of select="$iiif_json"/>-->
                                <h3>Seite <xsl:value-of select="$page_nr"/></h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card">
                                            <div class="body">
                                                <xsl:apply-templates/>
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
                                                    var source = "<xsl:value-of select="$iiif_json"/>";
                                                    OpenSeadragon({
                                                        id: "<xsl:value-of select="concat('img', $counter)"/>",
                                                        tileSources: [
                                                            source
                                                        ],
                                                        sequence: false,
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
    
<!--    <xsl:template match="tei:lb">
        <xsl:apply-templates/><br/>
    </xsl:template>-->
    <xsl:template match="tei:unclear">
        <abbr title="unclear"><xsl:apply-templates/></abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del><xsl:apply-templates/></del>
    </xsl:template>
    <xsl:template match="tei:rs">
        <strong><xsl:apply-templates/></strong>
    </xsl:template>
    <xsl:template match="tei:ab/text()">
        <xsl:analyze-string select="." regex="Nahmen und Class|Firma ad Raggion|Firma oder Raggion|Procura und Firmae Trager|Oblatorien und Avocatorien|Fundi Ausweisung|Societaets Contract und Interessenten">
            <xsl:matching-substring>
                <div class="kategorie"><xsl:value-of select="."/></div>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>