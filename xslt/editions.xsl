<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0" exclude-result-prefixes="xsl tei xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="./partials/html_footer.xsl"/>
    <xsl:variable name="iiif_server" select="'https://iiif.acdh.oeaw.ac.at/iiif/images/wkfm/'"/>

    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select="//tei:title[@type = 'main']"/>
        </xsl:variable>
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"/>
            </xsl:call-template>
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                    <div class="container">
                        <div class="card">
                            <div class="card-header" style="text-align:center">
                                <h1>
                                    <xsl:value-of select="//tei:title[@type = 'main']"/>
                                </h1>
                                
                                    <div class="alert alert-warning alert-dismissible fade show" role="alert"> Es handelt sich
                                        hierbei um reine Arbeitstranskripte, die weder Anspruch auf
                                        Vollständigkeit noch Korrektheit erheben.

                                            <span aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">schließen</span>
                                        
                                    </div>
                              
                            </div>
                            <div class="card-body">
                                <xsl:for-each select="//tei:text//tei:ab">
                                    <xsl:variable name="counter"
                                        select="concat('curNum__', position())"/>
                                    <xsl:variable name="facs_id"
                                        select="substring-after(data(./preceding::tei:pb[1]/@facs), '#')"/>
                                    <xsl:variable name="page_nr"
                                        select="data(./preceding::tei:pb[1]/@n)"/>
                                    <xsl:variable name="facs_el" select="id($facs_id)" as="node()"/>
                                    <xsl:variable name="img_id"
                                        select="substring-before(data($facs_el//@url), '.jpg')"/>
                                    <xsl:variable name="iiif_json"
                                        select="concat($iiif_server, $img_id, '.jp2/full/,600/0/default.jpg')"/>
                                    <div class="card">
                                        <div class="card-header" style="text-align:right">
                                            <small class="text-muted"><xsl:value-of select="$page_nr"/></small>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                  <div class="card">
                                                    <div class="body" id="{generate-id()}">
                                                        <xsl:apply-templates/>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="col-md-6" align="center">
                                                  <div class="card">
                                                    <div class="body">
                                                        <div style="width:400px; height:600px">
                                                            <img src="{$iiif_json}" loading="lazy"/>
                                                            <small>
                                                                <a>
                                                                    <xsl:attribute name="href">
                                                                        <xsl:value-of
                                                                        select="replace($iiif_json, ',600', 'full')"/>
                                                                    </xsl:attribute> zum Vollbild </a>
                                                            </small>
                                                        </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </div>

                        </div>

                    </div>
                    <xsl:call-template name="html_footer"/>
                </div>
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
        <abbr title="unclear">
            <xsl:apply-templates/>
        </abbr>
    </xsl:template>
    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates/>
        </del>
    </xsl:template>
    <xsl:template match="tei:rs">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    <xsl:template match="tei:ab/text()">
        <xsl:analyze-string select="."
            regex="Nahmen und Class|Firma ad Raggion|Firma oder Raggion|Procura und Firmae Trager|Oblatorien und Avocatorien|Fundi Ausweisung|Societaets Contract und Interessenten|Heuraths Contract|Anmerkungen">
            <xsl:matching-substring>
                <div class="kategorie">
                    <xsl:value-of select="."/>
                </div>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>
