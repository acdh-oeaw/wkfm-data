<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:html="http://www.w3.org/1999/xhtml"
    version="2.0">
    
    
    <xsl:import href="nav_bar.xsl"/>
    
    <xsl:template match="/">
        <html >
            <head>
                <title><xsl:value-of select="//tei:title[@level='main']"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>	
                <link rel="stylesheet" type="text/css" href="css/aratea.css"/>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
            </head>
            <body>
                <xsl:call-template name="nav_bar"/>
                <div class="container">
                    <h1>
                        <xsl:value-of select="//tei:title[@level='main']"/>
                    </h1>
                    <xsl:apply-templates select="//tei:text"/>
                </div>
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"  />
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"  />
            </body>
        </html>
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