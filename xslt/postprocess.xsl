<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"></xsl:output>
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Wiener Merkantilprotokoll <xsl:value-of select="replace(.//tei:title[@type='main']/text(), '_', ' ')"/></title>
                        <title type="sub">Digitale Edition des: Merkantil und Wechselgericht Merkantilprotokoll</title>
                        <principal><persName>Peter Rauscher</persName></principal>
                        <funder>
                            <name>FWF - Der Wissenschaftsfonds</name>
                            <address>
                                <street>Sensengasse 1</street>
                                <postCode>1090 Wien</postCode>
                                <placeName>
                                    <country>A</country>
                                    <settlement>Wien</settlement>
                                </placeName>
                            </address>
                        </funder>
                        <respStmt>
                            <resp>Transkription und Annotation</resp>
                            <persName>Peter Rauscher</persName>
                        </respStmt>
                        <respStmt>
                            <resp>Transkription und Annotation</resp>
                            <persName>Sandra Hoislbauer</persName>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc type="invetory">
                            <msIdentifier>
                                <institution>Wiener Stadt- und Landesarchiv (WStLA)</institution>
                                <repository>Bestand 2.3.2 - Merkantil- und Wechselgericht | 1725-1850-(1863)</repository>
                                <idno type="archive">WStLA 2.3.2.B6.1</idno>
                            </msIdentifier>
                            <msContents>
                                <msItem>
                                    <locus><xsl:value-of select="substring-after(replace(.//tei:title[@type='main']/text(), '_', ' '), 'fol ')"/></locus>
                                </msItem>
                            </msContents>
                            <history>
                                <origin notBefore="1725-01-01" notAfter="1758-12-31"/>
                            </history>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <xsl:copy-of select=".//tei:facsimile"/>
            <text>
                <xsl:copy-of select=".//tei:body"/>
            </text>
        </TEI>
    </xsl:template>
    
</xsl:stylesheet>