(function(a){a.SewisePlayerSkin={version:"1.0.0"};a.SewisePlayer=a.SewisePlayer||{}})(window);(function(a){a.SewisePlayer.IVodPlayer=a.SewisePlayer.IVodPlayer||{play:function(){},pause:function(){},stop:function(){},seek:function(){},changeClarity:function(){},setVolume:function(){},toPlay:function(){},duration:function(){},playTime:function(){},type:function(){},showTextTip:function(){},hideTextTip:function(){},muted:function(){},bufferProgress:function(){}}})(window);(function(a){a.SewisePlayerSkin.IVodSkin=a.SewisePlayerSkin.IVodSkin||{player:function(){},started:function(){},paused:function(){},stopped:function(){},seeking:function(){},buffering:function(){},bufferProgress:function(){},loadedProgress:function(){},loadedOpen:function(){},loadedComplete:function(){},programTitle:function(){},duration:function(){},playTime:function(){},startTime:function(){},loadSpeed:function(){},initialClarity:function(){},lang:function(){},logo:function(){},timeUpdate:function(){},
volume:function(){},clarityButton:function(){},timeDisplay:function(){},controlBarDisplay:function(){},topBarDisplay:function(){},customStrings:function(){},customDatas:function(){},fullScreen:function(){},noramlScreen:function(){},initialAds:function(){},initialStatistics:function(){}}})(window);(function(){SewisePlayerSkin.Utils={stringer:{time2FigFill:function(a){var b,a=Math.floor(a);10>a?b="0"+a:b=""+a;return b},secondsToHMS:function(a){if(!(0>a)){var b=this.time2FigFill(Math.floor(a/3600)),c=this.time2FigFill(a/60%60),a=this.time2FigFill(a%60);return b+":"+c+":"+a}},secondsToMS:function(a){if(!(0>a)){var b=this.time2FigFill(a/60),a=this.time2FigFill(a%60);return b+":"+a}},dateToTimeString:function(a){var b;b=a?a:new Date;var a=b.getFullYear(),c=b.getMonth()+1,i=b.getDate(),d=this.time2FigFill(b.getHours()),
f=this.time2FigFill(b.getMinutes());b=this.time2FigFill(b.getSeconds());return a+"-"+c+"-"+i+" "+d+":"+f+":"+b},dateToTimeStr14:function(a){var b=a.getFullYear(),c=this.time2FigFill(a.getMonth()+1),i=this.time2FigFill(a.getDate()),d=this.time2FigFill(a.getHours()),f=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return b+c+i+d+f+a},dateToStrHMS:function(a){var b=this.time2FigFill(a.getHours()),c=this.time2FigFill(a.getMinutes()),a=this.time2FigFill(a.getSeconds());return b+
":"+c+":"+a},dateToYMD:function(a){var b=a.getFullYear(),c=this.time2FigFill(a.getMonth()+1),a=this.time2FigFill(a.getUTCDate());return b+"-"+c+"-"+a},hmsToDate:function(a){var a=a.split(":"),b=new Date;b.setHours(a[0]?a[0]:0,a[1]?a[1]:0,a[2]?a[2]:0);return b},hmsToSeconds:function(a){var b=a.split(":"),a=b[0]?parseInt(b[0]):0,c=b[1]?parseInt(b[1]):0,b=b[2]?parseInt(b[2]):0;return 3600*a+60*c+b}},language:{zh_cn:{stop:"\u505c\u6b62\u64ad\u653e",pause:"\u6682\u505c",play:"\u64ad\u653e",fullScreen:"\u5168\u5c4f",
normalScreen:"\u6062\u590d",soundOn:"\u6253\u5f00\u58f0\u97f3",soundOff:"\u5173\u95ed\u58f0\u97f3",clarity:"\u6e05\u6670\u5ea6",titleTip:"\u6b63\u5728\u64ad\u653e\uff1a",claritySetting:"\u6e05\u6670\u5ea6\u8bbe\u7f6e",clarityOk:"\u786e\u5b9a",clarityCancel:"\u53d6\u6d88",backToLive:"\u56de\u5230\u76f4\u64ad",loading:"\u7f13\u51b2",subtitles:"\u5b57\u5e55","default":"\u9ed8\u8ba4"},en_us:{stop:"Stop",pause:"Pause",play:"Play",fullScreen:"Full Screen",normalScreen:"Normal Screen",soundOn:"Sound On",
soundOff:"Sound Off",clarity:"Clarity",titleTip:"Playing: ",claritySetting:"Definition Setting",clarityOk:"OK",clarityCancel:"Cancel",backToLive:"Back To Live",loading:"Loading",subtitles:"Subtitles","default":"Default"},lang:{},init:function(a){switch(a){case "en_US":this.lang=this.en_us;break;case "zh_CN":this.lang=this.zh_cn;break;default:this.lang=this.zh_cn}},getString:function(a){return this.lang[a]}}}})();(function(a){SewisePlayerSkin.BannersAds=function(b,c){function i(){u=SewisePlayerSkin.Utils.stringer.dateToYMD(new Date);k=c[u]||c["0000-00-00"];l=0;if(void 0!=k)n=k.length}function d(){for(var a=(new Date).getTime(),b=0;b<n;b++){var c=SewisePlayerSkin.Utils.stringer.hmsToDate(k[b].time).getTime();if(b<n-1){var i=SewisePlayerSkin.Utils.stringer.hmsToDate(k[b+1].time).getTime();if(a>c&&a<i){l=b;j(l);break}}else if(a>c){l=b;j(l);break}}}function f(){var a=(new Date).getTime();if(l<n-1){var b=SewisePlayerSkin.Utils.stringer.hmsToDate(k[l+
1].time).getTime();a>b&&(l++,j(l))}else SewisePlayerSkin.Utils.stringer.dateToYMD(new Date)!=u&&(i(),d())}function j(a){o=k[a].ads[0].picurl;g=k[a].ads[1].picurl;""==o&&""==g||(""==o&&""!=g?o=g:""!=o&&""==g&&(g=o),v.attr("src",o),x.attr("src",g))}var h=a(' <div style="position:absolute; display:table; width:100%; height:100%;"><div style="display:table-cell; text-align:left; vertical-align:middle;"><img style="pointer-events:auto; cursor:pointer; width: auto; height: auto;"></div></div> ');h.appendTo(b);
var v=h.find("img"),h=a(' <div style="position:absolute; display:table; width:100%; height:100%;"><div style="display:table-cell; text-align:right; vertical-align:middle;"><img style="pointer-events:auto; cursor:pointer; width: auto; height: auto;"></div></div> ');h.appendTo(b);var x=h.find("img"),o,g,u,k,l,n;i();void 0!=k&&(1==n&&""==k[0].time?j(0):(d(),setInterval(f,1E4)),v.click(function(a){a.originalEvent.stopPropagation();a=k[l].ads[0].link_url;window.openAdsLink&&"function"==typeof window.openAdsLink?
window.openAdsLink(a):window.open(a,"_blank")}),x.click(function(a){a.originalEvent.stopPropagation();a=k[l].ads[1].link_url;window.openAdsLink&&"function"==typeof window.openAdsLink?window.openAdsLink(a):window.open(a,"_blank")}))}})(window.jQuery);(function(a){SewisePlayerSkin.AdsContainer=function(b,c){var i=b.$container,d=b.$sewisePlayerUi,f=c.banners;if(f){var j=a("<div class='sewise-player-ads-banner'></div>");j.css({position:"absolute",width:"100%",height:"100%",left:"0px",top:"0px",overflow:"hidden","pointer-events":"none"});j.appendTo(i);d.css("z-index",1);SewisePlayerSkin.BannersAds(j,f)}}})(window.jQuery);(function(a){SewisePlayerSkin.Statistics=function(b){function c(b){var c=b["request-url"],f=b["request-data"];setInterval(function(){a.ajax({type:"post",async:!1,dataType:"json",url:c,data:f,success:function(){},error:function(){console.log("play count ajax request fail!")}})},b["request-data"].intervallen?b["request-data"].intervallen:1E4)}(b=b.playCount)&&c(b)}})(window.jQuery);(function(a){SewisePlayerSkin.ElementObject=function(){this.$sewisePlayerUi=a(".sewise-player-ui");this.$container=this.$sewisePlayerUi.parent();this.$video=this.$container.find("video").get(0);this.$controlbar=this.$sewisePlayerUi.find(".controlbar");this.$playBtn=this.$sewisePlayerUi.find(".controlbar-btns-play");this.$pauseBtn=this.$sewisePlayerUi.find(".controlbar-btns-pause");this.$stopBtn=this.$sewisePlayerUi.find(".controlbar-btns-stop");this.$fullscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-fullscreen");
this.$normalscreenBtn=this.$sewisePlayerUi.find(".controlbar-btns-normalscreen");this.$soundopenBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundopen");this.$soundcloseBtn=this.$sewisePlayerUi.find(".controlbar-btns-soundclose");this.$playtime=this.$sewisePlayerUi.find(".controlbar-playtime");this.$controlBarProgress=this.$sewisePlayerUi.find(".controlbar-progress");this.$progressPlayedLine=this.$sewisePlayerUi.find(".controlbar-progress-playedline");this.$progressPlayedPoint=this.$sewisePlayerUi.find(".controlbar-progress-playpoint");
this.$progressLoadedLine=this.$sewisePlayerUi.find(".controlbar-progress-loadedline");this.$progressSeekLine=this.$sewisePlayerUi.find(".controlbar-progress-seekline");this.$logo=this.$sewisePlayerUi.find(".logo");this.$logoIcon=this.$sewisePlayerUi.find(".logo-icon");this.$topbar=this.$sewisePlayerUi.find(".topbar");this.$programTip=this.$sewisePlayerUi.find(".topbar-program-tip");this.$programTitle=this.$sewisePlayerUi.find(".topbar-program-title");this.$topbarClock=this.$sewisePlayerUi.find(".topbar-clock");
this.$buffer=this.$sewisePlayerUi.find(".buffer");this.$bufferTip=this.$sewisePlayerUi.find(".buffer-text-tip");this.$bigPlayBtn=this.$sewisePlayerUi.find(".big-play-btn");this.defStageWidth=this.$container.width();this.defStageHeight=this.$container.height();this.defLeftValue=parseInt(this.$container.css("left"));this.defTopValue=parseInt(this.$container.css("top"));this.defOffsetX=this.$container.get(0).getBoundingClientRect().left;this.defOffsetY=this.$container.get(0).getBoundingClientRect().top;
this.defOverflow=a("body").css("overflow")}})(window.jQuery);(function(a){SewisePlayerSkin.ElementLayout=function(b){var c=b.$container,i=b.$controlBarProgress,d=b.$playtime,f=b.defStageWidth,j=b.defLeftValue,h=b.defTopValue,v=b.defOffsetX,x=b.defOffsetY,o=b.defOverflow,g=parseInt(f)-288;0>g&&(g+=d.width(),d.hide());i.css("width",g);this.fullScreen=function(b){if("not-support"==b){a("body").css("overflow","hidden");var b=a(window).width(),f=a(window).height();c.css("width",b);c.css("height",f);b=a(document).scrollLeft();f=a(document).scrollTop();parseInt(a("body").css("margin-left"));
var g=parseInt(a("body").css("margin-top")),f=h-x+f-g+"px";c.css("left",j-v+b+"px");c.css("top",f)}else c.css("width","100%"),c.css("height","100%");b=parseInt(a(window).width())-288;0>b?(b+=d.width(),d.hide()):d.show();i.css("width",b)};this.normalScreen=function(){c.css("width","100%");c.css("height","100%");c.css("left",j);c.css("top",h);a("body").css("overflow",o);g=parseInt(f)-288;0>g?(g+=d.width(),d.hide()):d.show();i.css("width",g)};this.resize=function(){f=c.width();c.height();g=parseInt(f)-
288;0>g?(g+=d.width(),d.hide()):d.show();i.css("width",g)}}})(window.jQuery);(function(){SewisePlayerSkin.LogoBox=function(a){var b=a.$logoIcon;b.click(function(a){a.originalEvent.stopPropagation()});var c="";this.setLogo=function(a){b.css("background","url("+a+") 0px 0px no-repeat");b.attr("href",c)};this.setLink=function(a){c=a;b.attr("href",c)}}})(window.jQuery);(function(){SewisePlayerSkin.TopBar=function(a){var b=a.$topbar,c=a.$programTip,i=a.$programTitle,d=a.$topbarClock,a=SewisePlayerSkin.Utils.language.getString("titleTip");c.text(a);setInterval(function(){var a=SewisePlayerSkin.Utils.stringer.dateToTimeString();d.text(a)},1E3);this.setTitle=function(a){i.text(a)};this.show=function(){b.css("visibility","visible")};this.hide=function(){b.css("visibility","hidden")};this.hide2=function(){b.hide()};this.initLanguage=function(){var a=SewisePlayerSkin.Utils.language.getString("titleTip");
c.text(a)}}})(window.jQuery);(function(a){SewisePlayerSkin.ControlBar=function(b,c,i){function d(){!1==P&&(z.css("visibility","visible"),i.show(),P=!0,y=setTimeout(h,Q))}function f(){0!=y&&(clearTimeout(y),y=0)}function j(){0==y&&(y=setTimeout(h,Q))}function h(){z.css("visibility","hidden");i.hide();P=!1}function v(a){a=m+(a.pageX-A);0<a&&a<r&&(s.css("width",a),p.css("left",a-E/2))}function x(b){n.unbind("mousemove",v);a(document).unbind("mouseup",x);K=b.pageX;A!=K&&(m=s.width(),B=m/r,q.seek(B*C));F=!1}function o(a){e=a.originalEvent;
1==e.targetTouches.length&&(e.preventDefault(),a=m+(e.targetTouches[0].pageX-A),0<a&&a<r&&(s.css("width",a),p.css("left",a-E/2)))}function g(a){e=a.originalEvent;p.unbind("touchmove",o);p.unbind("touchend",g);if(1==e.changedTouches.length)K=e.changedTouches[0].pageX,A!=K&&(m=s.width(),B=m/r,q.seek(B*C));F=!1}function u(){null!=document.fullscreenElement||null!=document.msFullscreenElement||null!=document.mozFullScreenElement||null!=document.webkitFullscreenElement?c.fullScreen():c.normalScreen();
t.timeUpdate(w)}function k(){c.resize();t.timeUpdate(w)}function l(){c.fullScreen("not-support");t.timeUpdate(w)}var n=b.$container,I=b.$video,z=b.$controlbar,J=b.$playBtn,D=b.$pauseBtn,W=b.$stopBtn,L=b.$fullscreenBtn,G=b.$normalscreenBtn,R=b.$soundopenBtn,M=b.$soundcloseBtn,X=b.$playtime,s=b.$progressPlayedLine,p=b.$progressPlayedPoint,Y=b.$progressLoadedLine,H=b.$progressSeekLine,S=b.$buffer,Z=b.$bufferTip,N=b.$bigPlayBtn,t=this,q,T="normal",C=0.1,w=0,U="00:00:00",V="00:00:00",E=0,F=!1,A=0,K=0,
m=0,r=0,B=0,P=!0,O=!1,y,Q=5E3,E=p.width(),r=H.width();D.hide();G.hide();M.hide();S.hide();y=setTimeout(h,Q);a(I).css("pointer-events","none");n.click(function(){n.mousemove();O?q.pause():q.play()});n.dblclick(function(){"normal"==T?t.fullScreen():t.noramlScreen()});n.bind({mousemove:d,touchmove:d});z.bind({mouseover:f,touchstart:f});z.bind({mouseout:j,touchend:j});z.click(function(a){a.originalEvent.stopPropagation()});J.click(function(){q.play()});D.click(function(){q.pause()});W.click(function(){q.stop()});
N.click(function(a){a.originalEvent.stopPropagation();q.play()});L.click(function(){t.fullScreen()});G.click(function(){t.noramlScreen()});R.click(function(){q.muted(!0);R.hide();M.show()});M.click(function(){q.muted(!1);R.show();M.hide()});H.mousedown(function(a){m=a.pageX-a.target.getBoundingClientRect().left;r=H.width();s.css("width",m);p.css("left",m-E/2);B=m/r;q.seek(B*C)});p.mousedown(function(b){this.blur();F=!0;A=b.pageX;m=s.width();r=H.width();n.bind("mousemove",v);a(document).bind("mouseup",
x)});p.bind("touchstart",function(a){e=a.originalEvent;p.blur();a=e.targetTouches[0];F=!0;A=a.pageX;m=s.width();r=H.width();p.bind("touchmove",o);p.bind("touchend",g)});document.addEventListener("fullscreenchange",u);document.addEventListener("MSFullscreenChange",u);document.addEventListener("mozfullscreenchange",u);document.addEventListener("webkitfullscreenchange",u);a(window).bind("resize",k);this.setPlayer=function(a){q=a};this.started=function(){J.hide();D.show();N.hide();O=!0};this.paused=function(){J.show();
D.hide();N.show();O=!1};this.stopped=function(){J.show();D.hide();N.show();O=!1};this.setDuration=function(a){C=Infinity!=a?a:3600;1<a&&(V=SewisePlayerSkin.Utils.stringer.secondsToHMS(C))};this.timeUpdate=function(a){if(void 0==a||Infinity==a)a=0;w=a;U=SewisePlayerSkin.Utils.stringer.secondsToHMS(w);X.text(U+"/"+V);F||(m=100*(w/C)+"%",s.css("width",m),a=s.width()-E/2,p.css("left",a))};this.loadProgress=function(a){Y.css("width",100*a+"%")};this.hide2=function(){z.hide()};this.fullScreen=function(){L.hide();
G.show();var b=n.get(0);a(window).unbind("resize",k);b.requestFullscreen?b.requestFullscreen():b.msRequestFullscreen?b.msRequestFullscreen():b.mozRequestFullScreen?b.mozRequestFullScreen():b.webkitRequestFullscreen?b.webkitRequestFullscreen():I.webkitEnterFullscreen?(I.play(),I.webkitEnterFullscreen(),L.show(),G.hide()):(c.fullScreen("not-support"),t.timeUpdate(w),a(window).bind("resize",l));T="full"};this.noramlScreen=function(){L.show();G.hide();document.exitFullscreen?document.exitFullscreen():
document.msExitFullscreen?document.msExitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitCancelFullScreen?document.webkitCancelFullScreen():(c.normalScreen(),t.timeUpdate(w),a(window).unbind("resize",l));T="normal";a(window).bind("resize",k)};this.showBuffer=function(){S.show()};this.hideBuffer=function(){S.hide()};this.initLanguage=function(){var a=SewisePlayerSkin.Utils.language.getString("loading");Z.text(a)}}})(window.jQuery);(function(a,b){b(document).ready(function(){var a=SewisePlayer.IVodPlayer,b=new SewisePlayerSkin.ElementObject,d=new SewisePlayerSkin.ElementLayout(b),f=new SewisePlayerSkin.LogoBox(b),j=new SewisePlayerSkin.TopBar(b),h=new SewisePlayerSkin.ControlBar(b,d,j);SewisePlayerSkin.IVodSkin.player=function(b){a=b;h.setPlayer(a)};SewisePlayerSkin.IVodSkin.started=function(){h.started()};SewisePlayerSkin.IVodSkin.paused=function(){h.paused()};SewisePlayerSkin.IVodSkin.stopped=function(){h.stopped()};SewisePlayerSkin.IVodSkin.duration=
function(a){h.setDuration(a)};SewisePlayerSkin.IVodSkin.timeUpdate=function(a){h.timeUpdate(a)};SewisePlayerSkin.IVodSkin.loadedProgress=function(a){h.loadProgress(a)};SewisePlayerSkin.IVodSkin.loadedOpen=function(){h.showBuffer()};SewisePlayerSkin.IVodSkin.loadedComplete=function(){h.hideBuffer()};SewisePlayerSkin.IVodSkin.programTitle=function(a){j.setTitle(a)};SewisePlayerSkin.IVodSkin.logo=function(a){f.setLogo(a)};SewisePlayerSkin.IVodSkin.volume=function(){};SewisePlayerSkin.IVodSkin.initialClarity=
function(){};SewisePlayerSkin.IVodSkin.clarityButton=function(){};SewisePlayerSkin.IVodSkin.timeDisplay=function(){};SewisePlayerSkin.IVodSkin.controlBarDisplay=function(a){"enable"!=a&&h.hide2()};SewisePlayerSkin.IVodSkin.topBarDisplay=function(a){"enable"!=a&&j.hide2()};SewisePlayerSkin.IVodSkin.customStrings=function(){};SewisePlayerSkin.IVodSkin.customDatas=function(a){a&&a.logoLink&&f.setLink(a.logoLink)};SewisePlayerSkin.IVodSkin.fullScreen=function(){h.fullScreen()};SewisePlayerSkin.IVodSkin.noramlScreen=
function(){h.noramlScreen()};SewisePlayerSkin.IVodSkin.initialAds=function(a){a&&SewisePlayerSkin.AdsContainer(b,a)};SewisePlayerSkin.IVodSkin.initialStatistics=function(a){a&&SewisePlayerSkin.Statistics(a)};SewisePlayerSkin.IVodSkin.lang=function(a){SewisePlayerSkin.Utils.language.init(a);h.initLanguage();j.initLanguage()};try{SewisePlayer.CommandDispatcher.dispatchEvent({type:SewisePlayer.Events.PLAYER_SKIN_LOADED,playerSkin:SewisePlayerSkin.IVodSkin})}catch(v){console.log("No Main Player")}})})(window,
window.jQuery);
