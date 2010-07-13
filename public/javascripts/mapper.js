/**
 * transm.js 2.31 (09-Apr-2010) (c) by Christian Effenberger 
 * All Rights Reserved. Source: mapper.netzgesta.de
 * Distributed under Netzgestade Software License Agreement.
 * This license permits free of charge use on non-commercial 
 * and private web sites only under special conditions. 
 * Read more at... http://www.netzgesta.de/cvi/LICENSE.html	
 * Commercial licenses available via... cvi[at]netzgesta[dot]de	
**/

var canvascheck = document.createElement('canvas');
var isIE = window.navigator.systemLanguage?1:0;
var isVM = document.namespaces?1:0; var isJG = 0;
var isCV = canvascheck.getContext?1:0; var jg = new Array();

if(isVM) {
	if(document.namespaces['v']==null) {
		var e=["shape","shapetype","group","background","path","formulas","handles","fill","stroke","shadow","textbox","textpath","imagedata","line","polyline","curve","roundrect","oval","rect","arc","image"],s=document.createStyleSheet(); 
		for(var i=0; i<e.length; i++) {s.addRule("v\\:"+e[i],"behavior: url(#default#VML); antialias: true;");} document.namespaces.add("v","urn:schemas-microsoft-com:vml");
	} 
}

function showCoords(map,ele,x,y,w,h) {}

function getClasses(classes,string){
	var temp = '';
	for (var j=0;j<classes.length;j++) {
		if (classes[j] != string) {
			if (temp) {temp += ' '; }
			temp += classes[j];
		}
	}
	return temp;
}
function getClassValue(classes,string){
	var temp = 0; var pos = string.length;
	for (var j=0;j<classes.length;j++) {
		if (classes[j].indexOf(string) == 0) {
			temp = Math.min(classes[j].substring(pos),100);
			break;
		}
	}
	return Math.max(0,temp);
}
function getClassRGBColor(classes,string,color){
	var temp, val = color, pos = string.length;
	for (var j=0;j<classes.length;j++) {
		if (classes[j].indexOf(string) == 0) {
			temp = classes[j].substring(pos);
			val = temp.toLowerCase();
			break;
		}
	}
	if(!val.match(/^[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f]$/i)) {val = color||'000000'; }
	if(!isCV) {return val; }else {
		function hex2dec(hex){return(Math.max(0,Math.min(parseInt(hex,16),255)));}
		var cr=hex2dec(val.substr(0,2)),cg=hex2dec(val.substr(2,2)),cb=hex2dec(val.substr(4,2));
		return cr+','+cg+','+cb;
	}
}
function getClassAttribute(classes,string){
	var temp = 0; var pos = string.length;
	for (var j=0;j<classes.length;j++) {
		if (classes[j].indexOf(string) == 0) {
			temp = 1; break;
		}
	}
	return temp;
}
function getMaps(className){
	var children = document.getElementsByTagName('img'); 
	var elements = new Array(); var i = 0; var mapname = '';
	var child; var classNames; var j = 0; var mapid = '';
	for(i=0;i<children.length;i++) {
		child = children[i]; classNames = child.className.split(' ');
		for(j=0;j<classNames.length;j++) {
			if(classNames[j]==className) {
				mapname = child.useMap.split("#");
				if(mapname[1]!=''&&mapname[1].length>=1) {
					mapid = document.getElementsByName(mapname[1]);
					if(mapid) {elements.push(child); break;}
				}
			}
		}
	}
	return elements;
}
function fadeCanvas(id,opac) {
	var obj = document.getElementById(id);
    if(obj.fading==1 && opac<=100) {
		obj.style.opacity = opac/100; opac += 10;
		window.setTimeout("fadeCanvas('"+id+"',"+opac+")",10);
	}
}
function setAreaOver(obj,id,bd,co,op,nb,f,z) {
	var a, i, j, d, c, o, b, n, l, r, v, u, x, y, p, k = 0, t = '', r = obj.getAttribute('rel'), context, canvas = document.getElementById(id);
	if(r!=null) {d = r.split(","); v = d.unshift(obj.id); }else {d = new Array(obj.id); }
	function setAttr() {
		if(l.indexOf('forcegroup')!=-1) {k = getClassAttribute(u,"forcegroup");}else {k=0;}
		if(l.indexOf('iopacity')!=-1) {o = getClassValue(u,"iopacity")/100;}else {o=op;}	
		if(l.indexOf('iborder')!=-1) {b = getClassRGBColor(u,"iborder",bd);}else {b=bd;}
		if(l.indexOf('icolor')!=-1) {c = getClassRGBColor(u,"icolor",co);}else {c=co;}
		if(l.indexOf('noborder')!=-1) {n = getClassAttribute(u,"noborder");}else {n=nb;}
	}
	if(isVM) {
		for(a=0;a<d.length;a++) {
			obj = document.getElementById(d[a]); if(obj) { 
			p = '', l = obj.className, u = l.split(" "), v = obj.coords.split(",");
			if(k==0) {setAttr();} 
			if(obj.shape.toLowerCase()=='rect') {
				t += '<v:rect strokeweight="1" filled="t" stroked="'+(n<1?"t":"f")+'" strokecolor="#'+b+'" style="zoom:1;margin:0;padding:0;display:block;position:absolute;left:'+parseInt(v[0])+'px;top:'+parseInt(v[1])+'px;width:'+parseInt(v[2]-v[0])+'px;height:'+parseInt(v[3]-v[1])+'px;"><v:fill color="#'+c+'" opacity="'+o+'" /></v:rect>';
			}else if(obj.shape.toLowerCase()=='circle') {
				t += '<v:oval strokeweight="1" filled="t" stroked="'+(n<1?"t":"f")+'" strokecolor="#'+b+'" style="zoom:1;margin:0;padding:0;display:block;position:absolute;left:'+parseInt(v[0]-v[2])+'px;top:'+parseInt(v[1]-v[2])+'px;width:'+(parseInt(v[2])*2)+'px;height:'+(parseInt(v[2])*2)+'px;"><v:fill color="#'+c+'" opacity="'+o+'" /></v:oval>';
			}else {
				for(j=2;j<v.length;j+=2) {p += parseInt(v[j])+','+parseInt(v[j+1])+',';}
				t += '<v:shape strokeweight="1" filled="t" stroked="'+(n<1?"t":"f")+'" strokecolor="#'+b+'" coordorigin="0,0" coordsize="'+canvas.width+','+canvas.height+'" path="m '+parseInt(v[0])+','+parseInt(v[1])+' l '+p+' x e" style="zoom:1;margin:0;padding:0;display:block;position:absolute;top:0px;left:0px;width:'+canvas.width+'px;height:'+canvas.height+'px;"><v:fill color="#'+c+'" opacity="'+o+'" /></v:shape>'; 
			}}
		} canvas.innerHTML = t;
	}else if(isCV) {
		if(f<1) {canvas.fading = 0; canvas.style.opacity = 0;}
		context = canvas.getContext("2d");
		for(a=0;a<d.length;a++) {
			obj = document.getElementById(d[a]); if(obj) {
			l = obj.className, u = l.split(" "), v = obj.coords.split(",");
			if(k==0) {setAttr();} context.beginPath();
			if(obj.shape.toLowerCase()=='rect') {
				context.rect(0.5+parseInt(v[0]),0.5+parseInt(v[1]),parseInt(v[2]-v[0]),parseInt(v[3]-v[1])); context.closePath();
			}else if(obj.shape.toLowerCase()=='circle') {
				context.arc(0.5+parseInt(v[0]),0.5+parseInt(v[1]),parseInt(v[2]),0,(Math.PI/180)*360,false);		
			}else {
				context.moveTo(parseInt(v[0]),parseInt(v[1])); for(j=2;j<v.length;j+=2) {context.lineTo(parseInt(v[j]),parseInt(v[j+1]));} context.closePath();
			} context.fillStyle = 'rgba('+c+','+o+')'; context.strokeStyle = 'rgba('+b+',1)'; context.fill(); if(n<1) {context.stroke();}}
		} if(f<1) {canvas.fading = 1; fadeCanvas(id,0);}
	}else {
		o = op; l = obj.className; u = l.split(" ");
		if(l.indexOf('forcegroup')!=-1) { k = getClassAttribute(u,"forcegroup");
		if(k!=0) {if(l.indexOf('iopacity')!=-1) {o = getClassValue(u,"iopacity")/100; k=0;}}}
		if(isIE) {canvas.style.filter = "Alpha(opacity="+(o*100)+")";
		}else {canvas.style.opacity = o; canvas.style.MozOpacity = o; canvas.style.KhtmlOpacity = o;}
		for(a=0;a<d.length;a++) {
			obj = document.getElementById(d[a]); if(obj) {
			l = obj.className, u = l.split(" "), v = obj.coords.split(",");
			if(k==0) {
				if(l.indexOf('forcegroup')!=-1) {k = getClassAttribute(u,"forcegroup");}else {k=0;}
				if(l.indexOf('icolor')!=-1) {c = getClassRGBColor(u,"icolor",co);}else {c=co;}
			} jg[z].setColor("#"+c);
			if(obj.shape.toLowerCase()=='rect') {
				jg[z].fillRect(parseInt(v[0]),parseInt(v[1]),parseInt(v[2]-v[0])+1,parseInt(v[3]-v[1])+1);
			}else if(obj.shape.toLowerCase()=='circle') {
				jg[z].fillEllipse(parseInt(v[0]-v[2]),parseInt(v[1]-v[2]),parseInt(v[2])*2+1,parseInt(v[2])*2+1);
			}else {x = new Array(); y = new Array(); i = 0; for(j=0;j<v.length;j+=2) {x[i] = parseInt(v[j]); y[i] = parseInt(v[j+1]); i++;} jg[z].fillPolygon(x,y);
			} jg[z].paint();}
		}
	}
}
function setAreaOut(obj,id,f,z) {
	var canvas = document.getElementById(id);
	if(isVM) {canvas.innerHTML = '';}else 
	if(isJG) {jg[z].clear();}else if(isCV) {
		var context = canvas.getContext("2d");
		context.clearRect(0,0,canvas.width,canvas.height);
	}
}
function getCoords(e,n,a,i,x,y,w,h,pw,ph) {
	var t, o, ox, oy, ex, ey, cx, cy, px=0, py=0;
	if (!e) {e = window.event; }
	if (e.pageX || e.pageY) {px = e.pageX; py = e.pageY;}
	ex = e.clientX; ey = e.clientY;
	if(self.pageXOffset||self.pageYOffset) {
		ox = self.pageXOffset; if(ox>0 && px==ex) {ex -= ox; }
		oy = self.pageYOffset; if(oy>0 && py==ey) {ey -= oy; }
	}else if(document.documentElement) {
		ox = document.documentElement.scrollLeft; 
		oy = document.documentElement.scrollTop;
	}else if(document.body) {
		ox = document.body.scrollLeft; oy = document.body.scrollTop;
	} 
	if(document.body.scrollHeight!=ph||document.body.scrollWidth!=pw) {
		var o = document.getElementById(i);
		var t = findPosXY(o); x = t.x; y = t.y;
	}
	cx = Math.min(Math.max(ex+ox-x,0),w); 
	cy = Math.min(Math.max(ey+oy-y,0),h);
	showCoords(n,a,cx,cy,w,h);
}
function findPosXY(ele) {
	var t; var d = {x:ele.offsetLeft, y:ele.offsetTop };
	if(ele.offsetParent) { t = findPosXY(ele.offsetParent); d.x += t.x; d.y += t.y;}
	return d;
}
function roundedRect(ctx,x,y,width,height,radius,nopath){
	if (!nopath) ctx.beginPath();
	ctx.moveTo(x,y+radius);
	ctx.lineTo(x,y+height-radius);
	ctx.quadraticCurveTo(x,y+height,x+radius,y+height);
	ctx.lineTo(x+width-radius,y+height);
	ctx.quadraticCurveTo(x+width,y+height,x+width,y+height-radius);
	ctx.lineTo(x+width,y+radius);
	ctx.quadraticCurveTo(x+width,y,x+width-radius,y);
	ctx.lineTo(x+radius,y);
	ctx.quadraticCurveTo(x,y,x,y+radius);
	if (!nopath) ctx.closePath();
}
function getRadius(radius,width,height){
	var part = (Math.min(width,height)/100);
	radius = Math.max(Math.min(100,radius/part),0);
	return radius + '%';
}
function addMapper() {
	var themaps = getMaps('mapper');
	var image, object, bgrnd, canvas, blind, context, mapid, mname, ele, atr; 
	var classes = '', newClasses = '', func = '', tmp, i, j, o, b, c, d, r, t, n, f, x, y, w, h, pw, ph;
	for(i=0;i<themaps.length;i++) {
		image = themaps[i]; object = image.parentNode;
		if(image.id=='') {image.id = "gmipam_"+i;}
		object.style.position = (object.style.position=='static'||object.style.position==''?'relative':object.style.position);
		object.style.height = image.height+'px';
		object.style.width = image.width+'px';
		object.style.padding = 0+'px';
		object.style.MozUserSelect = "none";
		object.style.KhtmlUserSelect = "none"; 
		object.unselectable = "on";
		r = 0; n = 0; f = 0; b = '0000ff'; c = '000000'; o = 33;
		if(isCV) {canvas = document.createElement('canvas');}else if(isVM) {
		canvas = document.createElement(['<var style="zoom:1;overflow:hidden;display:block;width:'+image.width+'px;height:'+image.height+'px;padding:0;">'].join(''));
		}else {canvas = document.createElement('div');}
		canvas.id = image.id+'_canvas';
		classes = image.className.split(' '); 
		r = getClassValue(classes,"iradius");
		o = getClassValue(classes,"iopacity");
		b = getClassRGBColor(classes,"iborder",'0000ff');
		c = getClassRGBColor(classes,"icolor",'000000');
		n = getClassAttribute(classes,"noborder");
		f = getClassAttribute(classes,"nofade");
		d = getClassAttribute(classes,"showcoords");
		o = o==0?0.33:o/100; r = parseInt(Math.min(Math.min(image.width/4,image.height/4),r));
		newClasses = getClasses(classes,"mapper");
		image.className = newClasses;
		mname = image.useMap.split("#"); mname = mname[1];
		mapid = document.getElementsByName(mname);
		if(mapid.length>0) {	
			for(j=0;j<mapid[0].areas.length;j++) {
				if(mapid[0].areas[j].shape.match(/(rect|poly|circle)/i)) {
					if(window.opera||mapid[0].areas[j].coords!='') {
						if(mapid[0].areas[j].id=='') {mapid[0].areas[j].id = mname+'_'+j;}
						if(isVM||isIE) {
							func=mapid[0].areas[j].onmouseover; if(func!=null) {tmp=String(func); func=(tmp.indexOf('function')>=0?tmp.match(/\{([^}]+)\}/):tmp); func=(typeof(func)=='object'?func[1]:func);}
							mapid[0].areas[j].onmouseover = new Function('setAreaOver(this,"'+canvas.id+'","'+b+'","'+c+'","'+o+'",'+n+','+f+','+i+');'+func); 
							func=mapid[0].areas[j].onmouseout; if(func!=null) {tmp=String(func); func=(tmp.indexOf('function')>=0?tmp.match(/\{([^}]+)\}/):tmp); func=(typeof(func)=='object'?func[1]:func);}
							mapid[0].areas[j].onmouseout = new Function('setAreaOut(this,"'+canvas.id+'",'+f+','+i+');'+func); 
						}else {
							func = mapid[0].areas[j].getAttribute("onmouseover"); mapid[0].areas[j].setAttribute("onmouseover","setAreaOver(this,'"+canvas.id+"','"+b+"','"+c+"','"+o+"',"+n+","+f+","+i+");"+func); 
							func = mapid[0].areas[j].getAttribute("onmouseout"); mapid[0].areas[j].setAttribute("onmouseout","setAreaOut(this,'"+canvas.id+"',"+f+","+i+");"+func); 
						}
					}
				}
			}
		}
		canvas.style.height = image.height+'px';
		canvas.style.width = image.width+'px';
		canvas.height = image.height;
		canvas.width = image.width;
		canvas.left = 0; canvas.top = 0;
		canvas.style.position = 'absolute';
		canvas.style.left = 0+'px';
		canvas.style.top = 0+'px';
		canvas.fading = 0;
		image.className = '';
		image.style.cssText = '';
		image.left = 0; image.top = 0;
		image.style.position = 'absolute';
		image.style.height = image.height+'px';
		image.style.width = image.width+'px';
		image.style.left = 0+'px';
		image.style.top = 0+'px';
		image.style.MozUserSelect = "none";
		image.style.KhtmlUserSelect = "none"; 
		image.unselectable = "on";
		if(isIE) {image.style.filter = "Alpha(opacity=0)";
		}else {image.style.opacity = 0;
  		image.style.MozOpacity = 0;
  		image.style.KhtmlOpacity = 0;}
		if(isCV && r>0) {bgrnd = document.createElement('canvas');}else if(isVM && r>0) {
		bgrnd = document.createElement(['<var style="zoom:1;overflow:hidden;display:block;width:'+image.width+'px;height:'+image.height+'px;padding:0;">'].join(''));
		}else {bgrnd = document.createElement('img'); bgrnd.src = image.src;}
		bgrnd.id = image.id+'_image';
		bgrnd.left = 0; bgrnd.top = 0;
		bgrnd.style.position = 'absolute';
		bgrnd.style.height = image.height+'px';
		bgrnd.style.width = image.width+'px';
		bgrnd.style.left = 0+'px';
		bgrnd.style.top = 0+'px';
		object.insertBefore(canvas,image);
		blind = document.createElement('div');
		blind.id = mname+'_blind';
		blind.className = "blind_area";
		blind.left = 0; blind.top = 0;
		blind.style.position = 'absolute';
		blind.style.height = image.height+'px';
		blind.style.width = image.width+'px';
		blind.style.left = 0+'px';
		blind.style.top = 0+'px';
		blind.innerHTML = " ";
		object.insertBefore(blind,image);
		if(isCV) {
			context = canvas.getContext("2d");
			context.clearRect(0,0,canvas.width,canvas.height);
		}else if(!isVM && !isCV) {if(isIE) {
			canvas.style.filter = "Alpha(opacity="+(o*100)+")";
			}else { canvas.style.opacity = o;
  			canvas.style.MozOpacity = o;
  			canvas.style.KhtmlOpacity = o;}
			if(typeof(window['jsGraphics']) !== 'undefined') {
				jg[i] = new jsGraphics(canvas); isJG = 1;
			}
		}		
		object.insertBefore(bgrnd,canvas);
		if(isCV && r>0) {
			bgrnd.height = image.height; bgrnd.width = image.width;
			context = bgrnd.getContext("2d");
			context.clearRect(0,0,bgrnd.width,bgrnd.height);
			roundedRect(context,0,0,bgrnd.width,bgrnd.height,r);
			context.clip();
			context.fillStyle = 'rgba(0,0,0,0)';
			context.fillRect(0,0,bgrnd.width,bgrnd.height);
			context.drawImage(image,0,0,bgrnd.width,bgrnd.height);
		}else if(isVM && r>0) {
			bgrnd.height = image.height; bgrnd.width = image.width; r = getRadius(r,bgrnd.width,bgrnd.height);		
			bgrnd.innerHTML = '<v:roundrect arcsize="'+r+'" strokeweight="0" filled="t" stroked="f" fillcolor="#ffffff" style="zoom:1;margin:0;padding:0;display:block;position:absolute;left:0px;top:0px;width:'+bgrnd.width+'px;height:'+bgrnd.height+'px;"><v:fill src="'+image.src+'" type="frame" /></v:roundrect>';
		}		
		if(d>0) {
			ele = document.getElementById(image.id);
			w = parseInt(image.width); h = parseInt(image.height);
			t = findPosXY(ele); x = t.x; y = t.y;
			ph = document.body.scrollHeight; pw = document.body.scrollWidth;
			if(isVM||isIE) {
				func=image.onmousemove; if(func!=null) {tmp=String(func); func=(tmp.indexOf('function')>=0?tmp.match(/\{([^}]+)\}/):tmp); func=(typeof(func)=='object'?func[1]:func);}
				image.onmousemove = new Function('getCoords(event,"'+mname+'",0,"'+image.id+'",'+x+','+y+','+w+','+h+','+pw+','+ph+');'+func); 
			}else {
				func = image.getAttribute("onmousemove"); 
				image.setAttribute("onmousemove","getCoords(event,'"+mname+"',0,'"+image.id+"',"+x+","+y+","+w+","+h+","+pw+","+ph+");"+func); 
			}
			if(mapid.length>0) {
				for(j=0;j<mapid[0].areas.length;j++) {
					if(mapid[0].areas[j].shape.match(/(rect|poly|circle)/i)) { 
						if(window.opera||mapid[0].areas[j].coords!='') {
							atr = mapid[0].areas[j].id; 
							if(isVM||isIE) {
								func=mapid[0].areas[j].onmousemove; if(func!=null) {tmp=String(func); func=(tmp.indexOf('function')>=0?tmp.match(/\{([^}]+)\}/):tmp); func=(typeof(func)=='object'?func[1]:func);}
								mapid[0].areas[j].onmousemove = new Function('getCoords(event,"'+mname+'","'+atr+'","'+image.id+'",'+x+','+y+','+w+','+h+','+pw+','+ph+');'+func); 
							}else {
								func = mapid[0].areas[j].getAttribute("onmousemove"); 
								mapid[0].areas[j].setAttribute("onmousemove","getCoords(event,'"+mname+"','"+atr+"','"+image.id+"',"+x+","+y+","+w+","+h+","+pw+","+ph+");"+func); 
							}
						}
					}
				}
			}
		}
	}
}

if(window.attachEvent) window.attachEvent("onload",addMapper);
else window.addEventListener("load",addMapper,false);