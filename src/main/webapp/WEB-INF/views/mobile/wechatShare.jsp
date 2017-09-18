<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>

<%
Integer wechatTokenTime = 0;
String wechatToken = "";
String jsapiToken = "";
try {
	wechatTokenTime = Integer.parseInt((String) session.getAttribute("wechat_token_time"));
} catch (Exception e) {}
if(System.currentTimeMillis() - wechatTokenTime > 7100000) {
	BufferedReader in = null;
	try {
	String urlStr = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxe04b5cbb1afdca93&secret=e2f80332024f1d91b1a3c41bca3db344";
	URL url = new URL(urlStr);
	URLConnection connection = url.openConnection();
	connection.setRequestProperty("accept", "*/*");
	connection.setRequestProperty("connection", "Keep-Alive");
	connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
	connection.connect();
	String line;
	urlStr = "";
	in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	while((line = in.readLine()) != null) {
		wechatToken += line;
	}
	wechatToken = wechatToken.replaceAll("\\s*", "");
	wechatToken = wechatToken.substring(1, wechatToken.length()-1);
	if(wechatToken.split(",")[0].startsWith("\"access_token\":\"")) {
		wechatToken = wechatToken.split(",")[0].substring(16, wechatToken.split(",")[0].length()-1);
	} else {
		wechatToken = wechatToken.split(",")[1].substring(16, wechatToken.split(",")[1].length()-1);
	}
	in.close();

	urlStr = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+wechatToken+"&type=jsapi";
	url = new URL(urlStr);
    connection = url.openConnection();
	connection.setRequestProperty("accept", "*/*");
	connection.setRequestProperty("connection", "Keep-Alive");
	connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
	connection.connect();
	urlStr = "";
	in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	while((line = in.readLine()) != null) {
		jsapiToken += line;
	}

	} catch (Exception e) {}
	finally {
		try {in.close();}
		catch(Exception e2) {}
	}
	session.setAttribute("jsapi_token_json", jsapiToken);
	session.setAttribute("wechat_token", wechatToken);
	session.setAttribute("wechat_token_time", System.currentTimeMillis());
}
%>

<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
var sha1 = new function() {

var hexcase = 0; /*   hex   output   format.   0   -   lowercase;   1   -   uppercase                 */
var b64pad = ""; /*   base-64   pad   character.   "="   for   strict   RFC   compliance       */
var chrsz = 8; /*   bits   per   input   character.   8   -   ASCII;   16   -   Unicode             */

function hex_sha1(s) {
    return binb2hex(core_sha1(str2binb(s), s.length * chrsz));
}
function b64_sha1(s) {
    return binb2b64(core_sha1(str2binb(s), s.length * chrsz));
}
function str_sha1(s) {
    return binb2str(core_sha1(str2binb(s), s.length * chrsz));
}
function hex_hmac_sha1(key, data) {
    return binb2hex(core_hmac_sha1(key, data));
}
function b64_hmac_sha1(key, data) {
    return binb2b64(core_hmac_sha1(key, data));
}
function str_hmac_sha1(key, data) {
    return binb2str(core_hmac_sha1(key, data));
}
function sha1_vm_test() {
    return hex_sha1("abc") == "a9993e364706816aba3e25717850c26c9cd0d89d";
}
function core_sha1(x, len) {
    x[len >> 5] |= 0x80 << (24 - len % 32);
    x[((len + 64 >> 9) << 4) + 15] = len;
    var w = Array(80);
    var a = 1732584193;
    var b = -271733879;
    var c = -1732584194;
    var d = 271733878;
    var e = -1009589776;
    for (var i = 0; i < x.length; i += 16) {
        var olda = a;
        var oldb = b;
        var oldc = c;
        var oldd = d;
        var olde = e;
        for (var j = 0; j < 80; j++) {
            if (j < 16) w[j] = x[i + j];
            else w[j] = rol(w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16], 1);
            var t = safe_add(safe_add(rol(a, 5), sha1_ft(j, b, c, d)), safe_add(safe_add(e, w[j]), sha1_kt(j)));
            e = d;
            d = c;
            c = rol(b, 30);
            b = a;
            a = t;
        }
        a = safe_add(a, olda);
        b = safe_add(b, oldb);
        c = safe_add(c, oldc);
        d = safe_add(d, oldd);
        e = safe_add(e, olde);
    }
    return Array(a, b, c, d, e);
}
function sha1_ft(t, b, c, d) {
    if (t < 20) return (b & c) | ((~b) & d);
    if (t < 40) return b ^ c ^ d;
    if (t < 60) return (b & c) | (b & d) | (c & d);
    return b ^ c ^ d;
}
function sha1_kt(t) {
    return (t < 20) ? 1518500249 : (t < 40) ? 1859775393 : (t < 60) ? -1894007588 : -899497514;
}
function core_hmac_sha1(key, data) {
    var bkey = str2binb(key);
    if (bkey.length > 16) bkey = core_sha1(bkey, key.length * chrsz);

    var ipad = Array(16),
        opad = Array(16);
    for (var i = 0; i < 16; i++) {
        ipad[i] = bkey[i] ^ 0x36363636;
        opad[i] = bkey[i] ^ 0x5C5C5C5C;
    }

    var hash = core_sha1(ipad.concat(str2binb(data)), 512 + data.length * chrsz);
    return core_sha1(opad.concat(hash), 512 + 160);
}

function safe_add(x, y) {
    var lsw = (x & 0xFFFF) + (y & 0xFFFF);
    var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
    return (msw << 16) | (lsw & 0xFFFF);
}
function rol(num, cnt) {
    return (num << cnt) | (num >>> (32 - cnt));
}
function str2binb(str) {
    var bin = Array();
    var mask = (1 << chrsz) - 1;
    for (var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i >> 5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i % 32);
    return bin;
}
function binb2str(bin) {
    var str = "";
    var mask = (1 << chrsz) - 1;
    for (var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i >> 5] >>> (24 - i % 32)) & mask);
    return str;
}
function binb2hex(binarray) {
    var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
    var str = "";
    for (var i = 0; i < binarray.length * 4; i++) {
        str += hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8 + 4)) & 0xF) + hex_tab.charAt((binarray[i >> 2] >> ((3 - i % 4) * 8)) & 0xF);
    }
    return str;
}
function binb2b64(binarray) {
    var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    var str = "";
    for (var i = 0; i < binarray.length * 4; i += 3) {
        var triplet = (((binarray[i >> 2] >> 8 * (3 - i % 4)) & 0xFF) << 16) | (((binarray[i + 1 >> 2] >> 8 * (3 - (i + 1) % 4)) & 0xFF) << 8) | ((binarray[i + 2 >> 2] >> 8 * (3 - (i + 2) % 4)) & 0xFF);
        for (var j = 0; j < 4; j++) {
            if (i * 8 + j * 6 > binarray.length * 32) str += b64pad;
            else str += tab.charAt((triplet >> 6 * (3 - j)) & 0x3F);
        }
    }
    return str;
}

return hex_sha1;
};

var jsapiToken = eval('(${jsapi_token_json})').ticket;
var timestamp = parseInt(new Date().getTime()/1000);
var noncestr = sha1(new Date().getTime()+'').substring(0, 10);
var url = "jsapi_ticket="+jsapiToken+"&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+location.origin+location.pathname+location.search+"";
wx.config({
	debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
	appId: 'wxe04b5cbb1afdca93', // 必填，公众号的唯一标识
	timestamp: timestamp, // 必填，生成签名的时间戳
	nonceStr: noncestr, // 必填，生成签名的随机串
	signature: sha1(url),// 必填，签名，见附录1
	jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});
wx.ready(function() {
wx.onMenuShareTimeline({
    success: function() {
        console.log('share success.');
    },
	title: '${JkProject.projName==null?"鲸客网":JkProject.projName}', // 分享标题
	link: location.origin+location.pathname+location.search, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
	imgUrl: 'http://whalkers.com/resources/mobile/images/logo.jpg' // 分享图标
});
wx.onMenuShareAppMessage({
    success: function() {
        console.log('share success.');
    },
	desc: '鲸客校园，一站式校园活动解决专家。', // 分享标题
	title: '${JkProject.projName==null?"鲸客网":JkProject.projName}', // 分享描述
	link: location.origin+location.pathname+location.search, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
	imgUrl: 'http://whalkers.com/resources/mobile/images/logo.jpg'
});
});
wx.error(
    function(res) {console.log('error:\n'+res);}
);
</script>
