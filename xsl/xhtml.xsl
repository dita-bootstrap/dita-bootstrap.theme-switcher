<?xml version="1.0" encoding="utf-8"?>
<!--
	This file is part of the DITA Bootstrap Toggle plug-in for DITA Open Toolkit.
	See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  version="2.0"
  xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="xs dita-ot"
>
  <!-- Whether to include CSS them toggling.  values are 'yes' or 'no' -->
  <xsl:param name="CSS_THEME_SWITCHER_INCLUDE" select="'no'"/>


  <xsl:template match="/ | @* | node()" mode="processHDF">
    <xsl:variable name="relpath">
      <xsl:choose>
        <xsl:when test="$FILEDIR='.'">
          <xsl:text>.</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="replace(replace($FILEDIR, '\\', '/') ,'[^/]+','..')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:next-match/>

    <xsl:if test="$CSS_THEME_SWITCHER_INCLUDE = 'yes' and string-length($HDRFILE) > 0">
      <xsl:variable name="cssThemeHrefs" as="xs:string*" select="document($HDRFILE, /)//*[@data-bs-css-href]/string(@data-bs-css-href)"/>
      <xsl:if test="count($cssThemeHrefs) > 0">
        <script>
          <xsl:text>
(function() {
  var validThemes = [</xsl:text>
          <xsl:for-each select="$cssThemeHrefs">
            <xsl:if test="position() > 1">
              <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
          </xsl:for-each>
          <xsl:text>];
  var css = localStorage.getItem('css-theme');
  if (css) {
    if (validThemes.indexOf(css) !== -1) {
      var link = Array.prototype.find.call(document.querySelectorAll('link'), function(l) {
        return /\.min\.css$/.test(l.href);
      });
      if (link) {
        if (link.href !== css) {
          link.removeAttribute('integrity');
          link.href = css;
        }
      }
    }
  }
})();
</xsl:text>
        </script>
      </xsl:if>
      <script language="javascript" src="{$relpath}/js/css-theme-switcher.js"/>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
