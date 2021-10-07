<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0" exclude-result-prefixes="tei xsl xs">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:import href="./partials/html_navbar.xsl"/>
    <xsl:import href="./partials/html_head.xsl"/>
    <xsl:import href="partials/html_footer.xsl"/>
    <xsl:template match="/">
        <xsl:variable name="doc_title">
            <xsl:value-of select=".//tei:title[@type='main'][1]/text()"/>
        </xsl:variable>
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml">
            <xsl:call-template name="html_head">
                <xsl:with-param name="html_title" select="$doc_title"></xsl:with-param>
            </xsl:call-template>
            
            <body class="page">
                <div class="hfeed site" id="page">
                    <xsl:call-template name="nav_bar"/>
                
                    <div class="wrapper" id="wrapper-hero" style="
                        background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('dist/fundament/images/acdh_building.jpg'); 
                        background-position: center;
                        background-repeat: no-repeat;
                        background-size: cover;
                        position: relative; ">
                        <div class="wrapper" id="wrapper-hero-content" >
                            <div class="container hero-dark" id="wrapper-hero-inner" tabindex="-1">
                                <h1><xsl:value-of select="$doc_title"/></h1>
                                <h2><xsl:value-of select=".//tei:title[@type='sub'][1]/text()"/></h2>
                                <p>Auf dieser Seite werden aktuelle Ergebnisse und im Projekt <strong><xsl:value-of select="$doc_title"/></strong> generierte Datensätze präsentiert und der Öffentlichkeit zugänglich gemacht</p>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row" style="padding-top:4em">
                            
                                <div class="col-sm">
                                    <div class="card" style="width: 18rem;">
                                        <!-- <img class="card-img-top" src="..." alt="Card image cap" /> -->
                                        <div class="card-body">
                                            <h3 class="card-title">Über das Projekt</h3>
                                            <p class="card-text">Informationen über das Projekt und das Projektteam</p>
                                            <a href="about.html" class="btn btn-round">Mehr</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm">
                                    <div class="card" style="width: 18rem;">
                                        <!-- <img class="card-img-top" src="..." alt="Card image cap" /> -->
                                        <div class="card-body">
                                            <h3 class="card-title">Faksimiles</h3>
                                            <p class="card-text">Zu den Faksimiles des Merkantilprotokolls</p>
                                            <a href="mirador.html" class="btn btn-round">Mehr</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm">
                                    <div class="card" style="width: 18rem;">
                                        <!-- <img class="card-img-top" src="..." alt="Card image cap" /> -->
                                        <div class="card-body">
                                            <h3 class="card-title">Transkription</h3>
                                            <p class="card-text">Zu der Arbeitstranskription des Merkantilprotokolls</p>
                                            <a href="toc.html" class="btn btn-round">Mehr</a>
                                        </div>
                                    </div>
                                </div>
                            
                        </div>
                    </div>
                    
                    
                    
                <xsl:call-template name="html_footer"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:div//tei:head">
        <h2 id="{generate-id()}"><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p id="{generate-id()}"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="tei:list">
        <ul id="{generate-id()}"><xsl:apply-templates/></ul>
    </xsl:template>
    
    <xsl:template match="tei:item">
        <li id="{generate-id()}"><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="tei:ref">
        <xsl:choose>
            <xsl:when test="starts-with(data(@target), 'http')">
                <a>
                    <xsl:attribute name="href"><xsl:value-of select="@target"/></xsl:attribute>
                    <xsl:value-of select="."/>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>