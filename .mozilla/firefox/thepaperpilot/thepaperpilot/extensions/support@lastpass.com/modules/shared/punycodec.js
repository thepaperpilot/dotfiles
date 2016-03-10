var g_punycodecache=[];function isipv6url(t){return t.match(/\[.*\]/)?!0:!1}
var punycode=new function(){function t(a,e,b){a=b?Math.floor(a/u):a>>1;a+=Math.floor(a/e);for(e=0;a>(n-r)*s>>1;e+=n)a=Math.floor(a/(n-r));return Math.floor(e+(n-r+1)*a/(a+v))}function w(a,e){a-=(26>a-97)<<5;return a+((!e&&26>a-65)<<5)}this.utf16={decode:function(a){for(var e=[],b=0,c=a.length,f,m;b<c;){f=a.charCodeAt(b++);if(55296===(f&63488)){m=a.charCodeAt(b++);if(55296!==(f&64512)||56320!==(m&64512))throw new RangeError("UTF-16(decode): Illegal UTF-16 sequence");f=((f&1023)<<10)+(m&1023)+65536}e.push(f)}return e},
encode:function(a){for(var e=[],b=0,c=a.length,f;b<c;){f=a[b++];if(55296===(f&63488))throw new RangeError("UTF-16(encode): Illegal UTF-16 value");65535<f&&(f-=65536,e.push(String.fromCharCode(f>>>10&1023|55296)),f=56320|f&1023);e.push(String.fromCharCode(f))}return e.join("")}};var n=36,u=700,r=1,s=26,v=38;this.decode=function(a,e){var b=[],c=[],f=a.length,m,h,d,j,g,k,p,l,q;m=128;d=0;j=72;g=a.lastIndexOf("-");0>g&&(g=0);for(k=0;k<g;++k){e&&(c[b.length]=26>a.charCodeAt(k)-65);if(128<=a.charCodeAt(k))throw new RangeError("Illegal input >= 0x80");
b.push(a.charCodeAt(k))}for(g=0<g?g+1:0;g<f;){k=d;h=1;for(p=n;;p+=n){if(g>=f)throw RangeError("punycode_bad_input(1)");l=a.charCodeAt(g++);l=10>l-48?l-22:26>l-65?l-65:26>l-97?l-97:n;if(l>=n)throw RangeError("punycode_bad_input(2)");if(l>Math.floor((2147483647-d)/h))throw RangeError("punycode_overflow(1)");d+=l*h;q=p<=j?r:p>=j+s?s:p-j;if(l<q)break;if(h>Math.floor(2147483647/(n-q)))throw RangeError("punycode_overflow(2)");h*=n-q}h=b.length+1;j=t(d-k,h,0===k);if(Math.floor(d/h)>2147483647-m)throw RangeError("punycode_overflow(3)");
m+=Math.floor(d/h);d%=h;e&&c.splice(d,0,26>a.charCodeAt(g-1)-65);b.splice(d,0,m);d++}if(e){d=0;for(f=b.length;d<f;d++)c[d]&&(b[d]=String.fromCharCode(b[d]).toUpperCase().charCodeAt(0))}return this.utf16.encode(b)};this.encode=function(a,e){var b,c,f,m,h,d,j,g,k,p;e&&(p=this.utf16.decode(a));a=this.utf16.decode(a.toLowerCase());var l=a.length;if(e)for(d=0;d<l;d++)p[d]=a[d]!=p[d];var q=[];b=128;c=0;h=72;for(d=0;d<l;++d)128>a[d]&&q.push(String.fromCharCode(p?w(a[d],p[d]):a[d]));f=m=q.length;for(0<m&&
q.push("-");f<l;){j=2147483647;for(d=0;d<l;++d)g=a[d],g>=b&&g<j&&(j=g);if(j-b>Math.floor((2147483647-c)/(f+1)))throw RangeError("punycode_overflow (1)");c+=(j-b)*(f+1);b=j;for(d=0;d<l;++d){g=a[d];if(g<b&&2147483647<++c)return Error("punycode_overflow(2)");if(g==b){j=c;for(g=n;;g+=n){k=g<=h?r:g>=h+s?s:g-h;if(j<k)break;q.push(String.fromCharCode(k+(j-k)%(n-k)+22+75*(26>k+(j-k)%(n-k))-0));j=Math.floor((j-k)/(n-k))}q.push(String.fromCharCode(j+22+75*(26>j)-((0!=(e&&p[d]?1:0))<<5)));h=t(c,f+1,f==m);c=
0;++f}}++c;++b}return q.join("")};this.get_host=function(a,e){var b=a;if(isipv6url(a)&&e){var c=a.match(/\[.*\](:\d+)/);if(c)return c[0]}c=b.indexOf("://");-1!=c&&(b=b.substring(c+3));c=b.indexOf("/");-1!=c&&(b=b.substring(0,c));c=b.indexOf("?");-1!=c&&(b=b.substring(0,c));c=b.indexOf("@");-1!=c&&(b=b.substring(c+1));c=b.indexOf(":");-1!=c&&(b=b.substring(0,c));-1!=b.indexOf(".",b.length-1)&&(b=b.substring(0,b.length-1));return b};this.URLToASCII=function(a){if("string"!=typeof a)return a;"undefined"==
typeof g_punycodecache&&(g_punycodecache=[]);if("undefined"!=typeof g_punycodecache[a])return g_punycodecache[a];var e=!1;isipv6url(a)&&(e=!0);var b=this.get_host(a,e),e=this.ToASCII(b,e);if(e==b)return g_punycodecache[a]=c,a;var c=a.replace(b,e);return g_punycodecache[a]=c};this.ToASCII=function(a,e){var b=a.split(".");e&&(b=[a]);var c=[],f=/[^A-Za-z0-9-]/;e&&(f=/[^\[\]A-Za-z0-9:.-]/);for(var m=0;m<b.length;++m){var h=b[m];c.push(h.match(f)?"xn--"+punycode.encode(h):h)}return c.join(".")};this.URLToUnicode=
function(a){if("string"!=typeof a)return a;var e=this.get_host(a),b=this.ToUnicode(e);return b==e?a:a.replace(e,b)};this.ToUnicode=function(a){a=a.split(".");for(var e=[],b=0;b<a.length;++b){var c=a[b];e.push(c.match(/^xn--/)?punycode.decode(c.slice(4)):c)}return e.join(".")}};
