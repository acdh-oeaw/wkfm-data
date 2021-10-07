<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl xs"
    version="2.0">
    <xsl:template match="/" name="html_footer">
        
        <div class="wrapper fundament-default-footer" id="wrapper-footer-full" style="margin-top: 4em;">
            <div class="container" id="footer-full-content" tabindex="-1">
                <div class="footer-separator">
                    <i data-feather="message-circle"></i> CONTACT
                </div>
                <div class="row">
                    <div class="footer-widget col-lg-1 col-md-2 col-sm-2 col-xs-6  ml-auto  text-center ">
                        <div class="textwidget custom-html-widget">
                            <a href="/"><img src="https://fundament.acdh.oeaw.ac.at/common-assets/images/acdh_logo.svg" class="image" alt="ACDH Logo" style="max-width: 100%; height: auto;" title="ACDH Logo"/></a>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    <div class="footer-widget col-lg-4 col-md-3 col-sm-3">
                        <div class="textwidget custom-html-widget">
                            <p>
                                ACDH-CH ÖAW
                                <br/>
                                Austrian Centre for Digital Humanities and Cultural Heritage
                                <br/>
                                Österreichische Akademie der Wissenschaften
                            </p>
                            <p>
                                Sonnenfelsgasse 19
                                <br/>
                                1010 Wien
                            </p>
                            <p>
                                T: +43 1 51581-2200
                                <br/>
                                E: <a href="mailto:acdh@oeaw.ac.at">acdh@oeaw.ac.at</a>
                            </p>
                        </div>
                    </div>
                    <div class="footer-widget col-lg-4 col-md-3 col-sm-4">
                        <div class="container">
                            <div class="row">
                                  
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="flex-md-row mb-4 align-items-center">
                                        <a href="https://www.fwf.ac.at/en/"><img class="card-img-right flex-auto d-md-block" src="https://www.fwf.ac.at/fileadmin/files/Images/News_Presse/Presse/Logo/fwf-logo_var2.jpg" alt="FWF Der Wissenschaftsfond Logo" style="max-width: 140px; height: auto; margin-top:1em;" title="FWF Der Wissenschaftsfond" /></a>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="flex-md-row mb-4 align-items-center">
                                        <a href="https://www.univie.ac.at/en/"><img class="card-img-right flex-auto d-md-block" src="https://communications.univie.ac.at/fileadmin/user_upload/d_oeffentlichkeitsarbeit/Logos/2016-02/Uni_Logo_2016.jpg" alt="Universität Wien Logo" style="max-width: 160px; height: auto; vertical-align: middle;" title="Universität Wien" /></a>
                                        
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                    <div class="footer-widget col-lg-3 col-md-4 col-sm-3 ml-auto">
                        <div class="textwidget custom-html-widget">
                            <h6 class="font-weight-bold">HELPDESK</h6>
                            <p>ACDH-CH runs a helpdesk offering advice for questions related to various digital humanities topics.</p>
                            <p>
                                <a class="helpdesk-button" href="mailto:acdh-helpdesk@oeaw.ac.at">ASK US!</a>
                            </p>
                        </div>
                    </div>
                    <!-- .footer-widget -->
                </div>
            </div>
        </div>
        <!-- #wrapper-footer-full -->
        <div class="footer-imprint-bar" id="wrapper-footer-secondary" style="text-align:center; padding:0.4rem 0; font-size: 0.9rem;" >
            © Copyright OEAW | <a href="https://www.oeaw.ac.at/die-oeaw/impressum/">Impressum/Imprint</a>
        </div>
        <script type="text/javascript" src="dist/fundament/vendor/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="dist/fundament/js/fundament.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.11.0/b-2.0.0/b-html5-2.0.0/cr-1.5.4/r-2.2.9/sp-1.4.0/datatables.min.js"></script>
        <script type="text/javascript" src="js/dt.js"></script>
    </xsl:template>
</xsl:stylesheet>