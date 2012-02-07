((function(){var a,b=function(a,b){return function(){return a.apply(b,arguments)}},c=Object.prototype.hasOwnProperty,d=function(a,b){function e(){this.constructor=a}for(var d in b)c.call(b,d)&&(a[d]=b[d]);return e.prototype=b.prototype,a.prototype=new e,a.__super__=b.prototype,a};a=function(a){function c(){this.rebuildMosaic=b(this.rebuildMosaic,this),this.showMosaic=b(this.showMosaic,this),this.render=b(this.render,this),c.__super__.constructor.apply(this,arguments)}return d(c,a),c.prototype.tagName="ul",c.prototype.initialize=function(a){return a==null&&(a={}),this.el=a.el||$("ul.nine_nine_mosaic"),this.imageItems=$(this.el).find("li.item.image_mosaic_panel"),this.textItems=$(this.el).find("li.item.text_mosaic_panel"),this.mosaicOptions={itemSelector:"li",filter:".shown",layoutMode:"fitRows"},this.render()},c.prototype.render=function(){var a=this;return this.createVoidPanels(),this.imageItems.detach(),setTimeout(function(){return a.showMosaic()},100)},c.prototype.createVoidPanels=function(){var a,b,c,d;this.voidPanels=[],this.centerVoid=$("<li class='center_void void_item'><div></div></li>"),this.voidPanels=function(){var a;a=[];for(b=0;b<=7;b++)a.push($("<li class='void_item'><div></div></li>."));return a}(),c=9-$(this.el).find(".item").length-1,d=[];for(a=0;0<=c?a<c:a>c;0<=c?a++:a--)d.push(this.voidPanels[a].appendTo(this.el));return d},c.prototype.showMosaic=function(){var a=this;return $(this.el).find("li").fadeOut(),setTimeout(function(){return a.rebuildMosaic(),$(a.el).find("li").fadeIn()},600),setTimeout(function(){return a.showMosaic()},2500)},c.prototype.rebuildMosaic=function(){var a,b,c,d,e,f,g,h,i,j,k,l;b=$(this.el).find("li.item, li.void_item").detach(),this.randomizePanels(this.imageItems)&&this.randomizePanels(this.textItems),d=this.imageItems.slice(0,Math.ceil(1+Math.random()*2)),g=this.textItems[0],f=this.voidPanels.slice(0,7-d.length);for(h=0,j=d.length;h<j;h++)c=d[h],f.push(c);f.push(g),this.randomizePanels(f),a=f[4],f[3]=this.centerVoid,f.push(a),l=[];for(i=0,k=f.length;i<k;i++)e=f[i],l.push($(e).appendTo($(this.el)));return l},c.prototype.randomizePanels=function(a){return a.sort(function(a){return Math.round(Math.random())-.5})},c}(Backbone.View),(typeof exports!="undefined"&&exports!==null?exports:this).NineNineMosaicView=a})).call(this),function(){$(function(){return this.mosaic=new NineNineMosaicView})}.call(this);