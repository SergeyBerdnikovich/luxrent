!function(t){t("hasher",["signals"],function(t){var e=function(e){function i(t){if(!t)return"";var e=new RegExp("^\\"+d.prependHash+"|\\"+d.appendHash+"$","g");return t.replace(e,"")}function n(){var t=w.exec(d.getURL());return t&&t[1]?decodeURIComponent(t[1]):""}function s(){return m?m.contentWindow.frameHash:null}function o(){m=b.createElement("iframe"),m.src="about:blank",m.style.display="none",b.body.appendChild(m)}function a(){if(m&&p!==s()){var t=m.contentWindow.document;t.open(),t.write("<html><head><title>"+b.title+'</title><script type="text/javascript">var frameHash="'+p+'";</script></head><body>&nbsp;</body></html>'),t.close()}}function r(t,e){if(p!==t){var n=p;p=t,D&&(e?m.contentWindow.frameHash=t:a()),d.changed.dispatch(i(t),i(n))}}function l(t,e,i){t.addEventListener?t.addEventListener(e,i,!1):t.attachEvent&&t.attachEvent("on"+e,i)}function h(t,e,i){t.removeEventListener?t.removeEventListener(e,i,!1):t.detachEvent&&t.detachEvent("on"+e,i)}function c(t){t=Array.prototype.slice.call(arguments);var e=t.join(d.separator);return e=e?d.prependHash+e.replace(C,"")+d.appendHash:e}function u(t){return t=encodeURI(t),k&&S&&(t=t.replace(/\?/,"%3F")),t}var d,p,f,g,m,v,y=25,b=e.document,_=(e.history,t.Signal),w=/#(.*)$/,x=/(\?.*)|(\#.*)/,C=/^\#/,k=!1,T="onhashchange"in e&&7!==b.documentMode,D=k&&!T,S="file:"===location.protocol;return v=D?function(){var t=n(),e=s();e!==p&&e!==t?d.setHash(i(e)):t!==p&&r(t)}:function(){var t=n();t!==p&&r(t)},d={VERSION:"1.1.2",appendHash:"",prependHash:"/",separator:"/",changed:new _,stopped:new _,initialized:new _,init:function(){g||(p=n(),T?l(e,"hashchange",v):(D&&(m||o(),a()),f=setInterval(v,y)),g=!0,d.initialized.dispatch(i(p)))},stop:function(){g&&(T?h(e,"hashchange",v):(clearInterval(f),f=null),g=!1,d.stopped.dispatch(i(p)))},isActive:function(){return g},getURL:function(){return e.location.href},getBaseURL:function(){return d.getURL().replace(x,"")},setHash:function(t){t=c.apply(null,arguments),t!==p&&(r(t),t===p&&(e.location.hash="#"+u(t)))},replaceHash:function(t){t=c.apply(null,arguments),t!==p&&(r(t,!0),t===p&&e.location.replace("#"+u(t)))},getHash:function(){return i(p)},getHashAsArray:function(){return d.getHash().split(d.separator)},dispose:function(){d.stop(),d.initialized.dispose(),d.stopped.dispose(),d.changed.dispose(),m=d=e.hasher=null},toString:function(){return'[hasher version="'+d.VERSION+'" hash="'+d.getHash()+'"]'}},d.initialized.memorize=!0,d}(window);return e})}("function"==typeof define&&define.amd?define:function(t,e,i){window[t]=i(window[e[0]])});