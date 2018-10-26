window.dhtmlXTooltip={};
dhtmlXTooltip.config={className:"dhtmlXTooltip tooltip",timeout_to_display:50,delta_x:200,delta_y:-20};
dhtmlXTooltip.tooltip=document.createElement("div");
dhtmlXTooltip.tooltip.className=dhtmlXTooltip.config.className;
dhtmlXTooltip.show=function(b,d){
	if(action == "create"){
		if (!!window.ActiveXObject || "ActiveXObject" in window){
			dhtmlXTooltip.config={className:"dhtmlXTooltip tooltip",timeout_to_display:50,delta_x:155,delta_y:-20};
		}else{
			dhtmlXTooltip.config={className:"dhtmlXTooltip tooltip",timeout_to_display:50,delta_x:-15,delta_y:-20};
		}
			
	}
	var c=dhtmlXTooltip,f=this.tooltip,a=f.style;
	c.tooltip.className=c.config.className;
	var e=this.position(b),k=b.target||b.srcElement;
	if(!this.isTooltip(k)){
		var g=0,l=0,h=scheduler._obj;
		if(h.offsetParent){
			do g+=h.offsetLeft,l+=h.offsetTop;
			while(h=h.offsetParent)
		}
		var i=e.x+(c.config.delta_x||0)-g,j=e.y-(c.config.delta_y||0)-l;
		a.visibility="hidden";
		a.removeAttribute?(a.removeAttribute("right"),a.removeAttribute("bottom")):(a.removeProperty("right"),a.removeProperty("bottom"));
        a.left="0";a.top="0";this.tooltip.innerHTML=d;scheduler._obj.appendChild(this.tooltip);var m=this.tooltip.offsetWidth,n=this.tooltip.offsetHeight;scheduler._obj.offsetWidth-i-(scheduler.xy.margin_left||0)-m<0?(a.removeAttribute?a.removeAttribute("left"):a.removeProperty("left"),a.right=scheduler._obj.offsetWidth-i+2*(c.config.delta_x||0)+"px"):a.left=i<0?e.x+Math.abs(c.config.delta_x||0)+"px":i+"px";scheduler._obj.offsetHeight-j-(scheduler.xy.margin_top||0)-n<0?(a.removeAttribute?a.removeAttribute("top"):
        a.removeProperty("top"),a.bottom=scheduler._obj.offsetHeight-j-2*(c.config.delta_y||0)+"px"):a.top=j<0?e.y+Math.abs(c.config.delta_y||0)+"px":j+"px";
        a.visibility="visible"
    }
};
dhtmlXTooltip.hide=function(){
	this.tooltip.parentNode&&this.tooltip.parentNode.removeChild(this.tooltip)
};
dhtmlXTooltip.delay=function(b,d,c,f){
	this.tooltip._timeout_id&&window.clearTimeout(this.tooltip._timeout_id);
	this.tooltip._timeout_id=setTimeout(function(){var a=b.apply(d,c);b=d=c=null;return a},f||this.config.timeout_to_display)};
dhtmlXTooltip.isTooltip=function(b){
	for(var d=!1;b&&!d;)d=b.className==this.tooltip.className,b=b.parentNode;return d
};
dhtmlXTooltip.position=function(b){
	b=b||window.event;
	if(b.pageX||b.pageY)
	   return{x:b.pageX,y:b.pageY};
	var d=dhtmlx._isIE&&document.compatMode!="BackCompat"?document.documentElement:document.body;
	return{x:b.x+d.scrollLeft-d.clientLeft,y:b.clientY+d.scrollTop-d.clientTop}
};
scheduler.attachEvent("onMouseMove",function(b,d){
	var c=window.event||d,f=c.target||c.srcElement,a=dhtmlXTooltip;
	if(b||a.isTooltip(f)){
		var e=scheduler.getEvent(b)||scheduler.getEvent(a.tooltip.event_id);
		if(e){
			a.tooltip.event_id=e.id;
			var k=scheduler.templates.tooltip_text(e.start_date,e.end_date,e),g=void 0;_isIE&&(g=document.createEventObject(c));
			a.delay(a.show,a,[g||c,k])
		}
	}else 
	   a.delay(a.hide,a,[])
	});
	scheduler.attachEvent("onBeforeDrag",function(){dhtmlXTooltip.hide();return!0}
);
scheduler.templates.tooltip_date_format=scheduler.date.date_to_str("%Y-%m-%d %H:%i");
scheduler.templates.tooltip_text=function(b,d,c){return"<b>Event:</b> "+c.text+"<br/><b>Start date:</b> "+scheduler.templates.tooltip_date_format(b)+"<br/><b>End date:</b> "+scheduler.templates.tooltip_date_format(d)};
