var Hex={decode:function(f){if(void 0==Hex.decoder){for(var c="0123456789ABCDEF",b=[],a=0;16>a;++a)b[c.charAt(a)]=a;c=c.toLowerCase();for(a=10;16>a;++a)b[c.charAt(a)]=a;for(a=0;8>a;++a)b[" \f\n\r\t\u00a0\u2028\u2029".charAt(a)]=-1;Hex.decoder=b}for(var c=[],e=b=0,a=0;a<f.length;++a){var d=f.charAt(a);if("="==d)break;d=Hex.decoder[d];if(-1!=d){if(void 0==d)throw"Illegal character at offset "+a;b|=d;2<=++e?(c[c.length]=b,e=b=0):b<<=4}}if(e)throw"Hex encoding incomplete: 4 bits missing";return c}};
