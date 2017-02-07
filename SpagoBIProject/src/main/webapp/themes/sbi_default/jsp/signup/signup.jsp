<%@ page language="java"
         extends="it.eng.spago.dispatching.httpchannel.AbstractHttpJspPagePortlet"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         session="true" 
         import="it.eng.spago.base.*,
                 it.eng.spagobi.commons.constants.SpagoBIConstants"
%>
<%@page import="it.eng.spagobi.commons.utilities.ChannelUtilities"%>
<%@page import="it.eng.spagobi.commons.utilities.messages.IMessageBuilder"%>
<%@page import="it.eng.spagobi.commons.utilities.messages.MessageBuilderFactory"%>
<%@page import="it.eng.spagobi.commons.utilities.urls.UrlBuilderFactory"%>
<%@page import="it.eng.spagobi.commons.utilities.urls.IUrlBuilder"%>
<%@page import="it.eng.spago.base.SourceBean"%>
<%@page import="it.eng.spago.navigation.LightNavigationManager"%>
<%@page import="it.eng.spagobi.utilities.themes.ThemesManager"%>
<%@page import="it.eng.spagobi.commons.constants.ObjectsTreeConstants"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="it.eng.spagobi.community.mapping.SbiCommunity"%>

<%@ include file="/WEB-INF/jsp/commons/portlet_base410.jsp"%>  

<%
	String defaultOrganization = msgBuilder.getMessage("profileattr.company",request); 
	String defaultName = msgBuilder.getMessage("profileattr.firstname",request);
	String defaultSurname = msgBuilder.getMessage("profileattr.lastname",request);
	String defaultUsername = msgBuilder.getMessage("username",request); //"Username";
	String defaultPassword = msgBuilder.getMessage("password",request); //"Password";
	String defaultEmail = msgBuilder.getMessage("profileattr.email",request);
	String defaultConfirmPwd = msgBuilder.getMessage("confirmPwd",request);
	String defaultCaptcha = msgBuilder.getMessage("signup.form.captcha",request); 
	String defaultLocation = msgBuilder.getMessage("signup.form.location",request);
	String defaultLanguage = msgBuilder.getMessage("signup.form.language",request);
	String defaultItalian = msgBuilder.getMessage("signup.form.langItalian",request);
	String defaultEnglish = msgBuilder.getMessage("signup.form.langEnglish",request);
	String defaultFrench = msgBuilder.getMessage("signup.form.langFrench",request);
	String defaultSpanish = msgBuilder.getMessage("signup.form.langSpanish",request);
	String defaultBirthday = msgBuilder.getMessage("signup.form.birthday",request);
	String defaultGender = msgBuilder.getMessage("signup.form.gender",request);
	String defaultMan = msgBuilder.getMessage("signup.form.genderMan",request);
	String defaultWoman = msgBuilder.getMessage("signup.form.genderWoman",request);
	String defaultCommunity = msgBuilder.getMessage("signup.form.community",request);
	String defaultShortBio = msgBuilder.getMessage("signup.form.shortBio",request);
		
	String registrationSuccessMsg = msgBuilder.getMessage("signup.msg.success",request);
	Locale localeSignup =  (request.getAttribute("locale")==null)?null:(Locale)request.getAttribute("locale");
	List comunities = (request.getAttribute("communities")==null)?new ArrayList():(List)request.getAttribute("communities");
	
%>

<link id="extall"     rel="styleSheet" href ="${pageContext.request.contextPath}/js/lib/ext-4.1.1a/resources/css/ext-all.css" type="text/css" />
<link id="theme-gray" rel="styleSheet" href ="${pageContext.request.contextPath}/js/lib/ext-4.1.1a/resources/css/ext-all-gray.css" type="text/css" />
<link id="spagobi-ext-4" rel="styleSheet" href ="${pageContext.request.contextPath}/js/lib/ext-4.1.1a/overrides/resources/css/spagobi.css" type="text/css" />

<html>
  <head>
  <style media="screen" type="text/css">

	
	body {
		background: #dedede; /* Old browsers *
		background: -moz-linear-gradient(top,  #dedede 0%, #efefef 100%); /* FF3.6+ */
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#dedede), color-stop(100%,#efefef)); /* Chrome,Safari4+ */
		background: -webkit-linear-gradient(top,  #dedede 0%,#efefef 100%); /* Chrome10+,Safari5.1+ */
		background: -o-linear-gradient(top,  #dedede 0%,#efefef 100%); /* Opera 11.10+ */
		background: -ms-linear-gradient(top,  #dedede 0%,#efefef 100%); /* IE10+ */
		background: linear-gradient(to bottom,  #dedede 0%,#efefef 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dedede', endColorstr='#efefef',GradientType=0 ); /* IE6-9 */
		height: 100%;
		margin: 0;
		background-repeat: no-repeat;
		background-attachment: fixed;
	}
	td.login-label{
 	font-family: Tahoma,Verdana,Geneva,Helvetica,sans-serif;
	font-size: 10 px;
	color: #7d7d7d;
}

a:link{
 	font-family: Tahoma,Verdana,Geneva,Helvetica,sans-serif;
	font-size: 14px;
	color: #F8A400;
	text-decoration:none;
}
a:visited{
 	font-family: Tahoma,Verdana,Geneva,Helvetica,sans-serif;
	font-size: 14px;
	color: #F8A400;
	text-decoration:none;
}
a:hover{
 	font-family: Tahoma,Verdana,Geneva,Helvetica,sans-serif;
	font-size: 14px;
	color: #F8A400;
	text-decoration:none;
}

.submit{clear:both;width:auto;padding-top:12px;text-align:center}
.submit input{border:0;height:42px;width:198px;padding:2px 31px 0;text-align:center;cursor:pointer;margin:0 0 20px;font-family:cabinregular,arial,helvetica,sans-serif;font-size:1.33em;font-weight:bold;line-height:100%;text-transform:uppercase;background:#F8A400;color:#fff;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px}
.submit input:hover{opacity:0.9;filter:alpha(opacity = 90)}

.footerMsg {color:#193B54;}

 </style>
  
  <link rel="shortcut icon" href="<%=urlBuilder.getResourceLink(request, "img/favicon.ico")%>" />
  <title>SpagoBI signup</title>
  <LINK rel='StyleSheet' 
    href='${pageContext.request.contextPath}/themes/sbi_default/css/spagobi_shared.css' 
    type='text/css' />
  
  <style>
      body {
	       padding: 0;
	       margin: 0;
      }
  </style> 
  </head>

  <body>
   
	 <div id="content" style="height:100%">
		Not available...  
	 </div>
  </body>
</html>
