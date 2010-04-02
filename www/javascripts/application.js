// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  $('.trackDownloads a').click(function(){
    var filename = this.pathname.substr(this.pathname.lastIndexOf("/")+1,this.pathname.length);
    _gaq.push(['_trackEvent', 'download', filename]);
    return true;
  });
});