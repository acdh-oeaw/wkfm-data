<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#"
    version="2.0" exclude-result-prefixes="#all">
    <xsl:output encoding="UTF-8" media-type="text/html" method="xhtml" version="1.0" indent="yes" omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <xsl:variable name="constants">
            <xsl:for-each select=".//node()[parent::acdh:RepoObject]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="TopColId">
            <xsl:value-of select="data(.//acdh:TopCollection/@rdf:about)"/>
        </xsl:variable>
        <rdf:RDF xmlns:acdh="https://vocabs.acdh.oeaw.ac.at/schema#">
            <acdh:TopCollection>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select=".//acdh:TopCollection/@rdf:about"/>
                </xsl:attribute>
                <xsl:copy-of select="$constants"/>
                <xsl:for-each select=".//node()[parent::acdh:TopCollection]">
                    <xsl:copy-of select="."/>
                </xsl:for-each>
            </acdh:TopCollection>
            
            
            <xsl:for-each select=".//node()[parent::acdh:MetaAgents]">
                <xsl:copy-of select="."/>
            </xsl:for-each>
            <xsl:for-each select=".//acdh:Collection">
                <acdh:Collection>
                    <xsl:attribute name="rdf:about"><xsl:value-of select="@rdf:about"/></xsl:attribute>
                    <xsl:copy-of select="$constants"/>
                    <xsl:for-each select=".//node()">
                        <xsl:copy-of select="."/>
                    </xsl:for-each>
                </acdh:Collection>
            </xsl:for-each>
            <acdh:Collection rdf:about="https://id.acdh.oeaw.ac.at/wkfm/faks">
                <acdh:isPartOf rdf:resource="https://id.acdh.oeaw.ac.at/wkfm"/>
                <acdh:hasTitle xml:lang="de">Faksimiles</acdh:hasTitle>
                <acdh:hasDescription xml:lang="de">Diese Sammlung enthält die Scans des ersten Wiener Merkantilprotokolls, angefertigt vom Wiener Stadt- und Landesarchiv</acdh:hasDescription>
                <acdh:hasNonLinkedIdentifier>WStLA, Einzelstück 2.3.2.B6.1 - Protokoll I | 1725-1758</acdh:hasNonLinkedIdentifier>
                <acdh:hasCoverageStartDate rdf:datatype="http://www.w3.org/2001/XMLSchema#date">1725-01-01</acdh:hasCoverageStartDate>
                <acdh:hasCoverageEndDate rdf:datatype="http://www.w3.org/2001/XMLSchema#date">1758-12-31</acdh:hasCoverageEndDate>
                <acdh:hasSpatialCoverage rdf:resource="https://sws.geonames.org/2761367/"/>
                <acdh:hasLicense rdf:resource="https://vocabs.acdh.oeaw.ac.at/archelicenses/cc-by-nc-nd-4-0"/>
                <acdh:hasLicensor rdf:resource="https://d-nb.info/gnd/2060831-7"/>
                <acdh:hasContact rdf:resource="https://d-nb.info/gnd/2060831-7"/>
                <acdh:hasOwner rdf:resource="https://d-nb.info/gnd/2060831-7"/>
                <acdh:hasRightsHolder rdf:resource="https://d-nb.info/gnd/2060831-7"/>
                <acdh:hasDepositor rdf:resource="https://d-nb.info/gnd/13140007X"/>
                <acdh:hasCurator rdf:resource="https://d-nb.info/gnd/13140007X"/>
                <acdh:hasCreator rdf:resource="https://d-nb.info/gnd/13140007X"/>
                <acdh:hasMetadataCreator rdf:resource="https://d-nb.info/gnd/13140007X"/>
            </acdh:Collection>
            <xsl:for-each select="collection('../data/editions')//tei:TEI">
                <xsl:variable name="partOf">
                    <xsl:value-of select="concat($TopColId, '/editions')"/>
                </xsl:variable>
                <xsl:variable name="id">
                    <xsl:value-of select="concat($TopColId, '/', @xml:id)"/>
                </xsl:variable>
                <acdh:Resource rdf:about="{$id}">
                    <!--<acdh:hasPid><xsl:value-of select=".//tei:idno[@type='handle']/text()"/></acdh:hasPid>-->
                    <acdh:hasTitle xml:lang="de"><xsl:value-of select=".//tei:title[@type='main'][1]/text()"/></acdh:hasTitle>
                    <!--<acdh:hasCoverage xml:lang="de"><xsl:value-of select="$datum"/></acdh:hasCoverage>-->
                    <acdh:hasAccessRestriction rdf:resource="https://vocabs.acdh.oeaw.ac.at/archeaccessrestrictions/public"/>
                    <acdh:hasCategory rdf:resource="https://vocabs.acdh.oeaw.ac.at/archecategory/text/tei"/>
                    <acdh:hasLanguage rdf:resource="https://vocabs.acdh.oeaw.ac.at/iso6393/deu"/>
                    <acdh:isPartOf rdf:resource="{$partOf}"/>
<!--                    <acdh:hasCoverageStartDate rdf:datatype="http://www.w3.org/2001/XMLSchema#date"><xsl:value-of select="$datum"/></acdh:hasCoverageStartDate>-->
                    <xsl:copy-of select="$constants"/>
                    <!--<xsl:for-each select=".//tei:person[@xml:id]">
                        <xsl:variable name="entId">
                            <xsl:choose>
                                <xsl:when test=".//tei:idno[@type='gnd']">
                                    <xsl:value-of select=".//tei:idno[@type='gnd']/text()"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('https://id.acdh.oeaw.ac.at/pmb/', (substring-after(@xml:id, 'pmb')))"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <acdh:hasActor>
                            <acdh:Person>
                                <xsl:attribute name="rdf:about"><xsl:value-of select="$entId"/></xsl:attribute>
                                <acdh:hasTitle xml:lang="und"><xsl:value-of select=".//tei:forename[1]/text()||' '||.//tei:surname[1]/text()"/></acdh:hasTitle>
                            </acdh:Person>
                        </acdh:hasActor>
                    </xsl:for-each>-->
                </acdh:Resource>
            </xsl:for-each>
        </rdf:RDF>
    </xsl:template>   
</xsl:stylesheet>