<%-- SpagoBI, the Open Source Business Intelligence suite

Copyright (C) 2012 Engineering Ingegneria Informatica S.p.A. - SpagoBI Competency Center
This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0, without the "Incompatible With Secondary Licenses" notice. 
If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/. --%>
 
  
<LINK rel='StyleSheet' 
	  href='<%=urlBuilder.getResourceLink(request, "js/src/ext/sbi/overrides/overrides.css")%>' 
	  type='text/css' />

	 
	 <% // get the current ext theme
	 String extTheme=ThemesManager.getTheExtTheme(currTheme);
	 %>
	  	  
<LINK rel='StyleSheet'
      href='<%=urlBuilder.getResourceLink(request, "js/lib/ext-2.0.1/resources/css/"+extTheme)%>'
      type='text/css' />
      
<LINK rel='StyleSheet'
      href='<%=urlBuilder.getResourceLink(request, "js/lib/overrides-ext-2.0.1/resources/css/"+extTheme)%>'
      type='text/css' />

<script>
	document.onselectstart = function() { return true; }
</script>