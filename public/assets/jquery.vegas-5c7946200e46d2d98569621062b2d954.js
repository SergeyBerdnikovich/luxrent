!function(t){function e(i,n){var s={align:"center",valign:"center"};if(t.extend(s,n),0==i.height())return console.log("pecouille"),i.load(function(){e(t(this),n)}),void 0;var o,a,r,l=t(window).width(),c=t(window).height(),u=i.width(),h=i.height(),d=c/l,p=h/u;d>p?(o=c/p,a=c):(o=l,a=l*p),r={width:o+"px",height:a+"px",top:"auto",bottom:"auto",left:"auto",right:"auto"},isNaN(parseInt(s.valign))?"top"==s.valign?r.top=0:"bottom"==s.valign?r.bottom=0:r.top=(c-a)/2:r.top=0-(a-c)/100*parseInt(s.valign)+"px",isNaN(parseInt(s.align))?"left"==s.align?r.left=0:"right"==s.align?r.right=0:r.left=(l-o)/2:r.left=0-(o-l)/100*parseInt(s.align)+"px",i.css(r)}function i(){l.prependTo("body").fadeIn()}function n(){l.fadeOut("fast",function(){t(this).remove()})}function s(){return t("body").css("backgroundImage")?t("body").css("backgroundImage").replace(/url\("?(.*?)"?\)/i,"$1"):void 0}var o,a=t("<img />").addClass("vegas-background"),r=t("<div />").addClass("vegas-overlay"),l=t("<div />").addClass("vegas-loading"),c=t(),u=null,h=[],d=0,p=5e3,f=function(){},g={init:function(o){var r={src:s(),align:"center",valign:"center",fade:0,loading:!0,load:function(){},complete:function(){}};t.extend(r,t.vegas.defaults.background,o),r.loading&&i();var l=a.clone();return l.css({position:"fixed",left:"0px",top:"0px"}).bind("load",function(){l!=c&&(t(window).bind("load resize.vegas",function(){e(l,r)}),c.is("img")?(c.stop(),l.hide().insertAfter(c).fadeIn(r.fade,function(){t(".vegas-background").not(this).remove(),t("body").trigger("vegascomplete",[this,d-1]),r.complete.apply(l,[d-1])})):l.hide().prependTo("body").fadeIn(r.fade,function(){t("body").trigger("vegascomplete",[this,d-1]),r.complete.apply(this,[d-1])}),c=l,e(c,r),r.loading&&n(),t("body").trigger("vegasload",[c.get(0),d-1]),r.load.apply(c.get(0),[d-1]),d&&(t("body").trigger("vegaswalk",[c.get(0),d-1]),r.walk.apply(c.get(0),[d-1])))}).attr("src",r.src),t.vegas},destroy:function(e){return e&&"background"!=e||(t(".vegas-background, .vegas-loading").remove(),t(window).unbind("resize.vegas"),c=t()),"overlay"==e&&t(".vegas-overlay").remove(),t.vegas},overlay:function(e){var i={src:null,opacity:null};return t.extend(i,t.vegas.defaults.overlay,e),r.remove(),r.css({margin:"0",padding:"0",position:"fixed",left:"0px",top:"0px",width:"100%",height:"100%"}),i.src&&r.css("backgroundImage","url("+i.src+")"),i.opacity&&r.css("opacity",i.opacity),r.prependTo("body"),t.vegas},slideshow:function(e,i){var n={step:d,delay:p,preload:!1,backgrounds:h,walk:f};if(t.extend(n,t.vegas.defaults.slideshow,e),n.backgrounds!=h&&(e.step||(n.step=0),e.walk||(n.walk=function(){}),n.preload&&t.vegas("preload",n.backgrounds)),h=n.backgrounds,p=n.delay,d=n.step,f=n.walk,clearInterval(o),!h.length)return t.vegas;var s=function(){0>d&&(d=h.length-1),(d>=h.length||!h[d-1])&&(d=0);var e=h[d++];e.walk=n.walk,"undefined"==typeof e.fade&&(e.fade=n.fade),e.fade>n.delay&&(e.fade=n.delay),t.vegas(e)};return s(),i||(u=!1,t("body").trigger("vegasstart",[c.get(0),d-1])),u||(o=setInterval(s,n.delay)),t.vegas},next:function(){var e=d;return d&&(t.vegas("slideshow",{step:d},!0),t("body").trigger("vegasnext",[c.get(0),d-1,e-1])),t.vegas},previous:function(){var e=d;return d&&(t.vegas("slideshow",{step:d-2},!0),t("body").trigger("vegasprevious",[c.get(0),d-1,e-1])),t.vegas},jump:function(e){var i=d;return d&&(t.vegas("slideshow",{step:e},!0),t("body").trigger("vegasjump",[c.get(0),d-1,i-1])),t.vegas},stop:function(){var e=d;return d=0,u=null,clearInterval(o),t("body").trigger("vegasstop",[c.get(0),e-1]),t.vegas},pause:function(){return u=!0,clearInterval(o),t("body").trigger("vegaspause",[c.get(0),d-1]),t.vegas},get:function(t){return null==t||"background"==t?c.get(0):"overlay"==t?r.get(0):"step"==t?d-1:"paused"==t?u:void 0},preload:function(e){var i=[];for(var n in e)if(e[n].src){var s=document.createElement("img");s.src=e[n].src,i.push(s)}return t.vegas}};t.vegas=function(e){return g[e]?g[e].apply(this,Array.prototype.slice.call(arguments,1)):"object"!=typeof e&&e?(t.error("Method "+e+" does not exist"),void 0):g.init.apply(this,arguments)},t.vegas.defaults={background:{},slideshow:{},overlay:{}}}(jQuery);