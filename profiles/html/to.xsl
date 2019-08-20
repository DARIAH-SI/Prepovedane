<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   xmlns:tei="http://www.tei-c.org/ns/1.0"
   xmlns:teidocx="http://www.tei-c.org/ns/teidocx/1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   exclude-result-prefixes="tei html teidocx xs"
   version="2.0">

   <xsl:import href="../../../../pub-XSLT/Stylesheets/html5-foundation6-chs/to.xsl"/>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet" type="stylesheet">
      <desc>
         <p>TEI stylesheet for making HTML5 output (Zurb Foundation 6 http://foundation.zurb.com/sites/docs/).</p>
         <p>This software is dual-licensed:
            
            1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
            Unported License http://creativecommons.org/licenses/by-sa/3.0/ 
            
            2. http://www.opensource.org/licenses/BSD-2-Clause
            
            
            
            Redistribution and use in source and binary forms, with or without
            modification, are permitted provided that the following conditions are
            met:
            
            * Redistributions of source code must retain the above copyright
            notice, this list of conditions and the following disclaimer.
            
            * Redistributions in binary form must reproduce the above copyright
            notice, this list of conditions and the following disclaimer in the
            documentation and/or other materials provided with the distribution.
            
            This software is provided by the copyright holders and contributors
            "as is" and any express or implied warranties, including, but not
            limited to, the implied warranties of merchantability and fitness for
            a particular purpose are disclaimed. In no event shall the copyright
            holder or contributors be liable for any direct, indirect, incidental,
            special, exemplary, or consequential damages (including, but not
            limited to, procurement of substitute goods or services; loss of use,
            data, or profits; or business interruption) however caused and on any
            theory of liability, whether in contract, strict liability, or tort
            (including negligence or otherwise) arising in any way out of the use
            of this software, even if advised of the possibility of such damage.
         </p>
         <p>Andrej Pančur, Institute for Contemporary History</p>
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>
  
   <!-- Uredi parametre v skladu z dodatnimi zahtevami za pretvorbo te publikacije: -->
   <!-- http://www2.sistory.si/publikacije/ -->
   <!-- ../../../  -->
   <xsl:param name="path-general"></xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/to.xsl -->
   <xsl:param name="outputDir">docs/</xsl:param>
   
   <xsl:param name="homeLabel">eZMono</xsl:param>
   <xsl:param name="homeURL">https://dariah-si.github.io/Prepovedane/</xsl:param>
   
   <xsl:param name="splitLevel">1</xsl:param>
   
   <!-- Iz datoteke ../../../../publikacije-XSLT/sistory/html5-foundation6-chs/my-html_param.xsl -->
   <xsl:param name="title-bar-sticky">false</xsl:param>
   
   <xsl:param name="chapterAsSIstoryPublications">false</xsl:param>
   
   <!-- V html/head izpisani metapodatki -->
   <xsl:param name="description"></xsl:param>
   <xsl:param name="keywords"></xsl:param>
   <xsl:param name="title">Libri prohibiti: rastoča zbirka bibliografskih, zgodovinskih in slikovnih podatkov o prepovedanih knjigah, najpogosteje branih na Slovenskem v zgodnjem novem veku</xsl:param>
   
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za front front/div</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-front-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Predgovor</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za glavno vsebino (glavna navigacija)</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-body-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Uvodna študija</xsl:text>
   </xsl:template>
   
   <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>Novo ime za izpis naziva priloge na gornji navigaciji</desc>
      <param name="thisLanguage"></param>
   </doc>
   <xsl:template name="nav-appendix-head">
      <xsl:param name="thisLanguage"/>
      <xsl:text>Zbirka podatkov</xsl:text>
   </xsl:template>
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>NASLOVNA STRAN: dopolnil s procesiranjem tei:byline; ref znotraj docImprin; popravil procesiranje docTitle</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template match="tei:titlePage">
      <!-- avtor -->
      <p  class="naslovnicaAvtor">
         <xsl:for-each select="tei:docAuthor">
            <xsl:choose>
               <xsl:when test="tei:forename or tei:surname">
                  <xsl:for-each select="tei:forename">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="tei:surname">
                     <xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="tei:surname">
                     <xsl:value-of select="."/>
                     <xsl:if test="position() ne last()">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:apply-templates/>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="position() ne last()">
               <br/>
            </xsl:if>
         </xsl:for-each>
      </p>
      <!-- naslov -->
      <xsl:for-each select="tei:docTitle/tei:titlePart">
         <xsl:choose>
            <xsl:when test="@type='subtitle'">
               <h1 class="subheader podnaslov"><xsl:value-of select="."/></h1>
            </xsl:when>
            <xsl:otherwise>
               <h1 class="text-center"><xsl:value-of select="."/></h1>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      <!-- dodan za byline -->
      <br/>
      <xsl:for-each select="tei:byline">
         <p class="text-center">
            <xsl:value-of select="."/>
         </p>
      </xsl:for-each>
      <br/>
      <xsl:if test="tei:figure">
         <div class="text-center">
            <p>
               <img src="{tei:figure/tei:graphic/@url}" alt="naslovna slika"/>
            </p>
         </div>
      </xsl:if>
      <xsl:if test="tei:graphic">
         <div class="text-center">
            <p>
               <img src="{tei:graphic/@url}" alt="naslovna slika"/>
            </p>
         </div>
      </xsl:if>
      <br/>
      <p class="text-center">
         <!-- dodan ref -->
         <xsl:for-each select="tei:docImprint/tei:ref">
            <xsl:apply-templates select="."/>
            <br/>
         </xsl:for-each>
         <!-- založnik -->
         <xsl:for-each select="tei:docImprint/tei:publisher">
            <xsl:apply-templates/>
            <br/>
         </xsl:for-each>
         <!-- kraj izdaje -->
         <xsl:for-each select="tei:docImprint/tei:pubPlace">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
         <!-- leto izdaje -->
         <xsl:for-each select="tei:docImprint/tei:docDate">
            <xsl:value-of select="."/>
            <br/>
         </xsl:for-each>
      </p>
   </xsl:template>
   
   
   <xsldoc:doc xmlns:xsldoc="http://www.oxygenxml.com/ns/doc/xsl">
      <xsldoc:desc>naredi strani z div: dodal sem kazalo vsebine pri zgornjem appendix, ki vsebuje div[@type='data']</xsldoc:desc>
   </xsldoc:doc>
   <xsl:template name="writeDiv">
      <xsl:variable name="BaseFile">
         <xsl:value-of select="$masterFile"/>
         <xsl:call-template name="addCorpusID"/>
      </xsl:variable>
      <!-- vključimo HTML5 deklaracijo, skupaj s kodo za delovanje starejših verzij Internet Explorerja -->
      <xsl:value-of select="$HTML5_declaracion" disable-output-escaping="yes"/>
      <html>
         <xsl:call-template name="addLangAtt"/>
         <xsl:variable name="pagetitle">
            <xsl:choose>
               <xsl:when test="tei:head">
                  <xsl:apply-templates select="tei:head" mode="plain"/>
               </xsl:when>
               <xsl:when test="self::tei:TEI">
                  <xsl:value-of select="tei:generateTitle(.)"/>
               </xsl:when>
               <xsl:when test="self::tei:text">
                  <xsl:value-of select="tei:generateTitle(ancestor::tei:TEI)"/>
                  <xsl:value-of select="concat('[', position(), ']')"/>
               </xsl:when>
               <xsl:otherwise>&#160;</xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <xsl:sequence select="tei:htmlHead($pagetitle, 2)"/>
         <body id="TOP">
            <xsl:call-template name="bodyMicroData"/>
            <xsl:call-template name="bodyJavascriptHook">
               <xsl:with-param name="thisLanguage" select="@xml:lang"/>
            </xsl:call-template>
            <xsl:call-template name="bodyHook"/>
            <!-- začetek vsebine -->
            <div class="column row">
               <!-- vstavim svoj header -->
               <xsl:if test="$topNavigation = 'true'">
                  <xsl:call-template name="html-header">
                     <xsl:with-param name="thisChapter-id" select="@xml:id"/>
                     <xsl:with-param name="thisLanguage" select="@xml:lang"/>
                  </xsl:call-template>
               </xsl:if>
               <!-- GLAVNA VSEBINA -->
               <section>
                  <div class="row">
                     <div class="medium-2 columns show-for-medium">
                        <p>
                           <xsl:call-template name="previousLink"/>
                        </p>
                     </div>
                     <div class="medium-8 small-12 columns">
                        <xsl:call-template name="stdheader">
                           <xsl:with-param name="title">
                              <xsl:call-template name="header"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </div>
                     <div class="medium-2 columns show-for-medium text-right">
                        <p>
                           <xsl:if test="parent::tei:div">
                              <xsl:call-template name="parentChapter"/>
                           </xsl:if>
                           <xsl:call-template name="nextLink"/>
                        </p>
                     </div>
                  </div>
                  <div class="row hide-for-medium">
                     <div class="small-6 columns text-center">
                        <p>
                           <xsl:call-template name="previousLink"/>
                        </p>
                     </div>
                     <div class="small-6 columns text-center">
                        <p>
                           <xsl:if test="parent::tei:div">
                              <xsl:call-template name="parentChapter"/>
                           </xsl:if>
                           <xsl:call-template name="nextLink"/>
                        </p>
                     </div>
                  </div>
                  <!--<xsl:if test="$topNavigationPanel = 'true'">
                         <xsl:element name="{if ($outputTarget='html5') then 'nav' else 'div'}">
                            <xsl:call-template name="xrefpanel">
                               <xsl:with-param name="homepage" select="concat($BaseFile, $standardSuffix)"/>
                               <xsl:with-param name="mode" select="local-name(.)"/>
                           </xsl:call-template>
                        </xsl:element>
                      </xsl:if>-->
                  <xsl:if test="$subTocDepth >= 0">
                     <xsl:call-template name="subtoc"/>
                  </xsl:if>
                  <xsl:call-template name="startHook"/>
                  <xsl:call-template name="makeDivBody">
                     <xsl:with-param name="depth" select="count(ancestor::tei:div) + 1"/>
                  </xsl:call-template>
                  <!-- če je part (in ima zato samo naslov), se doda kazalo vsebine -->
                  <!-- kazalo vsebine pri zgornjem appendix, ki vsebuje div[@type='data'] -->
                  <xsl:if test="$autoToc = 'true' and (self::tei:div[@type='part'] or self::tei:div[@type='appendix'][tei:div[@type='data']])">
                     <!-- kličem template partTOC, katerega prisilim, da gre samo eno stopnjo v globino -->
                     <xsl:call-template name="partTOC">
                        <xsl:with-param name="force">1</xsl:with-param>
                     </xsl:call-template>
                  </xsl:if>
                  <xsl:variable name="exist-note">
                     <xsl:call-template name="printNotes"/>
                  </xsl:variable>
                  <!-- .//tei:note -->
                  <xsl:if test="string-length($exist-note) gt 0">
                     <div class="row">
                        <div class="small-6 columns text-center">
                           <p>
                              <xsl:call-template name="previousLink"/>
                           </p>
                        </div>
                        <div class="small-6 columns text-center">
                           <p>
                              <xsl:call-template name="nextLink"/>
                           </p>
                        </div>
                     </div>
                  </xsl:if>
                  <xsl:call-template name="printNotes"/>
                  <div class="row">
                     <div class="small-6 columns text-center">
                        <p>
                           <xsl:call-template name="previousLink"/>
                        </p>
                     </div>
                     <div class="small-6 columns text-center">
                        <p>
                           <xsl:call-template name="nextLink"/>
                        </p>
                     </div>
                  </div>
                  <!--<xsl:if test="$bottomNavigationPanel = 'true'">
                         <xsl:element name="{if ($outputTarget='html5') then 'nav' else 'div'}">
                            <xsl:call-template name="xrefpanel">
                               <xsl:with-param name="homepage" select="concat($BaseFile, $standardSuffix)"/>
                               <xsl:with-param name="mode" select="local-name(.)"/>
                            </xsl:call-template>
                         </xsl:element>
                    </xsl:if>-->
                  <xsl:call-template name="stdfooter"/>
               </section>
            </div><!-- konec vsebine row column -->
            <xsl:call-template name="bodyEndHook"/>
         </body>
      </html>
   </xsl:template>
   
</xsl:stylesheet>
