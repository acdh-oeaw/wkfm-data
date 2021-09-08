<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <!--    written by Dario Kampkaspar https://github.com/dariok, many thanks!!!-->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:*[tei:rs[@continued]]">
        <xsl:element name="{local-name()}">
            <xsl:for-each-group select="node()"
                group-starting-with="tei:rs[@continued and following-sibling::*[1][self::tei:lb or self::tei:pb]]">
                <xsl:choose>
                    <xsl:when test="current-group()[@continued]">
                        <rs>
                            <xsl:sequence select="current-group()[1]/@*[not(name() = 'continued')] | current-group()[1]/node()" />
                            <xsl:sequence select="current-group()[(self::tei:pb or self::tei:lb) and position() lt 4]" />
                            <xsl:sequence select="current-group()[@continued and position() gt 2]/node()" />
                        </rs>
                        <xsl:sequence select="current-group()[position() gt 3 and not(@continued)]" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:sequence select="current-group()" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
        </xsl:element>
    </xsl:template>
    
    <!--<xsl:template match="tei:ab">
        <xsl:analyze-string select="." regex="Nahmen und Class">
            <xsl:matching-substring>
                <h3><xsl:value-of select="."/></h3>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:apply-templates select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>-->
</xsl:stylesheet>