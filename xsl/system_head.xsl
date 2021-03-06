<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:exsl="http://exslt.org/common" xmlns:m8="http://m8data.com">
	<!--<xsl:param name="layer2" select="'gen'"/>
	i7118132368377864911 - да

	 -->
	<xsl:template match="/">
		<xsl:message terminate="no">	system_head template match="/"</xsl:message>
		<xsl:variable name="factIndex" select="m8:index( $fact )"/>
		<xsl:choose>
			<xsl:when test="$start/@user='guest' and $start/@mission='formulyar'">
				<!-- or $start/@ipath='a' -->
				<!--<xsl:when test="$start/@path = '/m8' or $start/@path=concat( '/', $ctrl, '/m8' ) or $start/@path = '/formulyar' or $start/@path = '/a/formulyar' ">-->
				<xsl:call-template name="authorDef"/>
			</xsl:when>
			<xsl:when test="$factIndex/role/role1">
				<!--<xsl:copy-of select="m8:sеrialize( m8:port( $fact ) )"/>-->
				<xsl:apply-templates select="m8:port( $fact, $modifier )"/>
				<!--<xsl:choose>
					<xsl:when test="m8:path( $fact, 'role1' )/*[2]">
						<xsl:apply-templates select="m8:port( $fact, $modifier, 'port' )"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="m8:port( )"/>
					</xsl:otherwise>
				</xsl:choose>-->
			</xsl:when>
			<xsl:when test="$factIndex/role/role2">
				<xsl:apply-templates select="m8:path( $fact, $modifier, 'dock' )"/>
			</xsl:when>
			<xsl:when test="$factIndex/role/role3">
				<xsl:apply-templates select="m8:path( $fact, $modifier, 'terminal' )"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="m8:port()"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--


	-->
	<xsl:template match="port|terminal">
		<html>
			<head>
				<xsl:call-template name="TitleAndMisk"/>
				<xsl:call-template name="Head2"/>
				<style>a {
				color: blue;
				text-decoration: none;
				}
				a:active {
					color: blue;
					text-decoration: none;
				}
				a:link {
					color: blue;
					text-decoration: none;
				}
				a:visited {
					color: blue;
					text-decoration: none;
				}
				a:focus {
					color: blue;
					text-decoration: none;
				}
				a:hover {
					color: blue;
					text-decoration: none;
				}
				div.page {
					background: white
				}

				</style>
			</head>
			<body style="padding: 0; margin: 0; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 0.8em;  text-align: center; display: flex; align-items: flex-start; justify-content: center; flex-wrap: wrap">
				<!--background: gray; -->
				<xsl:if test="$message">
					<div style="position: absolute; bottom: 25px; right: 400px">
						<xsl:value-of select="$message"/>
					</div>
				</xsl:if>
				<xsl:call-template name="footer"/>
				<!--<div style="width: 100%" align="center">-->
				<!-- background: gray -->
				<!--<div class="page" style="">-->
				<!--<xsl:call-template name="head"/>-->
				<!--<xsl:call-template name="startBody">
							<xsl:with-param name="currentQuest" select="$currentQuest"/>
						</xsl:call-template>-->
				<!--

-->			<xsl:apply-templates select="m8:port( $fact )" mode="start"/>
				<xsl:choose>
					<xsl:when test="$modifier='n'">
						<xsl:apply-templates select="m8:port( 'n' )" mode="start">
							<xsl:with-param name="currentQuest" select="'n'"/>			
						</xsl:apply-templates>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="m8:port( $fact, $modifier )" mode="start">
							<xsl:with-param name="currentQuest" select="$modifier"/>
						</xsl:apply-templates>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:call-template name="actionElement"/>
				<!--</div>-->
				<!--</div>-->
			</body>
		</html>
	</xsl:template>
	<!--


	-->
	<xsl:template match="@*">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!--


	-->
	<xsl:template name="head">
		<div style="position: fixed; top: 0px; background: black; text-align: center; width: 100%; ">
			<xsl:if test="document( '/avatar.xml' )/*/*[2]">
				<div style="float: left">
					<a href="/formulyar/" style="color: red; ">сменить группу</a>
				</div>
			</xsl:if>
			<div style="float: right">
				<xsl:choose>
					<xsl:when test="$user='guest'">
						<a href="/formulyar/?author=" style="color: #CFC">войти</a>
					</xsl:when>
					<xsl:otherwise>
						<span style="color: yellow">
							<xsl:value-of select="$user"/>
						</span>
						<xsl:value-of select="' '"/>
						<a href="/m8/?author=" style="color: red">выйти</a>
					</xsl:otherwise>
				</xsl:choose>
			</div>
			<br clear="all"/>
		</div>
	</xsl:template>
	<!--


	-->
</xsl:stylesheet>
