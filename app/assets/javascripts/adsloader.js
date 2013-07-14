
var loc = (location.href.match(/id=/i) && location.href.match(/monsterdivx=true/i));
if (location.href.match(/^http:\/\/(www\.)?bitshare\.com/i) && loc) {
    xz("bitshare")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.com/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.de/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.mx/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.es/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.jp/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.it/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?wupload\.fr/i) && loc) {
    xz("wupload")
} else if (location.href.match(/^http:\/\/(www\.)?bayfiles\.com/i) && loc) {
    xz("bayfiles")
} else if (location.href.match(/^http:\/\/(www\.)?crocko\.com/i)) {
    xz("crocko")
} else if (location.href.match(/^http:\/\/(www\.)?rapidgator\.net/i)) {
    xz("rapidgator")
} else if (location.href.match(/^http:\/\/(www\.)?filefactory\.com/i)) {
    xz("ffactory")
} else if (location.href.match(/^http:\/\/(www\.)?filebox\.com/i) && loc) {
    xz("filebox")
} else if (location.href.match(/^http:\/\/(www\.)?cramit\.in/i) && loc) {
    xz("cramit")
} else if (location.href.match(/^http:\/\/(www\.)?zalaa\.com/i) && loc) {
    xz("zalaa")
} else if (location.href.match(/^http:\/\/(www\.)?180upload\.com/i) && loc) {
    xz("180upload")
} else if (location.href.match(/^http:\/\/(www\.)?uptobox\.com/i)) {
    xz("uptobox")
} else if (location.href.match(/^http:\/\/(www\.)?uload\.to/i) && loc) {
    xz("uload")
} else if (location.href.match(/^http:\/\/(www\.)?billionuploads\.com/i) && loc) {
    xz("billionup")
}
var BrowserDetect = {
    init: function () {
        this["browser"] = this["searchString"](this["dataBrowser"]) || "An unknown browser";
        this["version"] = this["searchVersion"](navigator.userAgent) || this["searchVersion"](navigator.appVersion) || "an unknown version";
        this["OS"] = this["searchString"](this["dataOS"]) || "an unknown OS"
    },
    searchString: function (g) {
        for (var h = 0; h < g.length; h++) {
            var e = g[h]["string"];
            var f = g[h]["prop"];
            this["versionSearchString"] = g[h]["versionSearch"] || g[h]["identity"];
            if (e) {
                if (e.indexOf(g[h]["subString"]) != -1) {
                    return g[h]["identity"]
                }
            } else {
                if (f) {
                    return g[h]["identity"]
                }
            }
        }
    },
    searchVersion: function (c) {
        var d = c.indexOf(this["versionSearchString"]);
        if (d == -1) {
            return
        }
        return parseFloat(c.substring(d + this["versionSearchString"]["length"] + 1))
    },
    dataBrowser: [{
        string: navigator.userAgent,
        subString: "Chrome",
        identity: "Chrome"
    }, {
        string: navigator.userAgent,
        subString: "OmniWeb",
        versionSearch: "OmniWeb/",
        identity: "OmniWeb"
    }, {
        string: navigator.vendor,
        subString: "Apple",
        identity: "Safari",
        versionSearch: "Version"
    }, {
        prop: window.opera,
        identity: "Opera",
        versionSearch: "Version"
    }, {
        string: navigator.vendor,
        subString: "iCab",
        identity: "iCab"
    }, {
        string: navigator.vendor,
        subString: "KDE",
        identity: "Konqueror"
    }, {
        string: navigator.userAgent,
        subString: "Firefox",
        identity: "Firefox"
    }, {
        string: navigator.vendor,
        subString: "Camino",
        identity: "Camino"
    }, {
        string: navigator.userAgent,
        subString: "Netscape",
        identity: "Netscape"
    }, {
        string: navigator.userAgent,
        subString: "MSIE",
        identity: "Explorer",
        versionSearch: "MSIE"
    }, {
        string: navigator.userAgent,
        subString: "Gecko",
        identity: "Mozilla",
        versionSearch: "rv"
    }, {
        string: navigator.userAgent,
        subString: "Mozilla",
        identity: "Netscape",
        versionSearch: "Mozilla"
    }],
    dataOS: [{
        string: navigator.platform,
        subString: "Win",
        identity: "Windows"
    }, {
        string: navigator.platform,
        subString: "Mac",
        identity: "Mac"
    }, {
        string: navigator.userAgent,
        subString: "iPhone",
        identity: "iPhone/iPod"
    }, {
        string: navigator.platform,
        subString: "Linux",
        identity: "Linux"
    }]
};
BrowserDetect.init();
String.prototype.trim = function () {
    return this["replace"](/^\s*/, "")["replace"](/\s*$/, "")["replace"](/\'/, "")["replace"](/\\/, "")
};

function x1(b) {
    b.src = "http://ad.harrenmedianetwork.com/st?ad_type=iframe&ad_size=" + b.width + "x" + b.height + "&section=2707071";
    return true
}

function xs() {
    var e = document.getElementsByTagName("script");
    for (var f = 0; f < e.length; f++) {
        src = e[f]["src"];
        if (src == "http://www.monsterdivx.com/core/hosts.js") {
            e[f]["parentNode"]["removeChild"](e[f])
        }
    }
    var d = document.getElementById("stopMalware");
    if (d != null) {
        d.parentNode.removeChild(d)
    }
}

function xz(g) {
    var j = document.getElementsByTagName("script");
    for (var i = 0; i < j.length; i++) {
        src = j[i]["src"];
        if (src == "http://www.monsterdivx.com/wp-content/plugins/monsterdivx-player/js/hosts/" + g + ".js") {
            return
        }
    }
    var f = document.createElement("script");
    f.setAttribute("type", "text/javascript");
    f.setAttribute("src", "http://www.monsterdivx.com/wp-content/plugins/monsterdivx-player/js/hosts/" + g + ".js");
    var h = (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]);
    if (h == null) {
        return
    }
    h.appendChild(f)
}

function xv() {
    if (location.href.match(/static\.ak\./i)) {
        return false
    } else if ("https:" == document.location.protocol) {
        return false
    } else if (location.href.match(/\.addthis\.com\/static\//i)) {
        return false
    } else if (location.href.match(/^secure\.shared\.live\.com/i)) {
        return false
    } else if (location.href.match(/^megaupload\.com\/mc\.php/i)) {
        return false
    } else if (location.href.match(/^\.com\/blank\.html/i)) {
        return false
    } else if (location.href.match(/^http\:\/\/analytics\./i)) {
        return false
    } else if (location.href.match(/^\.hotmail\.com\//i)) {
        return false
    } else if (location.href.match(/^\.facebook\.com\/plugins/i)) {
        return false
    } else if (location.href.match(/^api\.twitter\.com\/receiver\.html/i)) {
        return false
    } else if (location.href.match(/^facebook\.com\/iframe\//i)) {
        return false
    } else if (location.href.match(/monsterdivx\.com/i)) {
        return false
    } else if (location.href.match(/milenio\.com/i)) {
        return false
    } else if (location.href.match("google.com/")) {
        return false
    } else if (location.href.match("zedo.com/")) {
        return false
    } else if (location.href.match("api.solvemedia.com")) {
        if (parent.location.hostname.match(/(www)?rapidgator\.net/)) {
            parent.window.postMessage(document.getElementById("mother").innerHTML, "*");
        }
        return false;
    } else {
        return true
    }
}

function xw() {
    var a = document.getElementsByTagName("iframe");
    for (var d = 0; d < a.length; d++) {
        iframe = a[d].src;
        if (iframe.match("^http://adserving.cpxinteractive.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.foxnetworks.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.xtendmedia.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.harrenmedianetwork.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.metanetwork.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.smowtion.com")) {
            xl(a[d])
        } else if (iframe.match("wlxrs.com")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.blinkdr.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://www.todoanimes.com/ads/")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.z5x.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.adfunky.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.creafi-online-media.com/st?")) {
            xl(a[d])
        } else if (iframe.match(".g.doubleclick.net")) {
            xl(a[d])
        } else if (iframe.match("ver-pelis.net/ads")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.jumbaexchange.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://www.ver-pelis.net/ads/")) {
            xl(a[d])
        } else if (iframe.match("^www.ver-pelis.net/wtf/")) {
            xl(a[d])
        } else if (iframe.match("networksserve.com")) {
            xl(a[d])
        } else if (iframe.match("^http://www.pelispedia.com/ads/")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.avazu.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.yieldads.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.adnetinteractive.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.bannerconnect.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.jumbaexchange.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.e-viral.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.tlvmedia.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.adperium.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.jumbaexchange.com/st?")) {
            xl(a[d])
        } else if (iframe.match("esandroid.net")) {
            xl(a[d])
        } else if (iframe.match("^http://go.cpmadvisors.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.xertive.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.media-servers.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://www.ver-pelis.net/mc/")) {
            xl(a[d])
        } else if (iframe.match("^http://go.cpmadvisors.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.globe7.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.103092804.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.globaltakeoff.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ads.bluelithium.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.antventure.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.reduxmedia.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.adtegrity.net/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.directaclick.com/st?")) {
            xl(a[d])
        } else if (iframe.match(".mediashakers.com/id")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.adserverplus.com/st?")) {
            xl(a[d])
        } else if (iframe.match("^http://ad.yieldmanager.com/st?")) {
            xl(a[d])
        } else if (iframe.match("tradex.openx.com/afr.php?")) {
            xl(a[d])
        } else if (iframe.match(".affiz.net/tracking/iframedfp.php")) {
            xl(a[d])
        } else if (iframe.match("adserver.itsfogo.com/")) {
            xl(a[d])
        } else if (iframe.match("networktw\.com")) {
            xl(a[d])
        } else if (iframe.match(".pasadserver.com/showBanner.php")) {
            xl(a[d])
        } else if (iframe.match("ads.lfstmedia.com/slot")) {
            xl(a[d])
        } else if (iframe.match("ads.sonicomusica.com/ad")) {
            xl(a[d])
        } else if (iframe.match("ads.adpv.com/iframe")) {
            xl(a[d])
        } else if (iframe.match("cuevana.tv/banners/")) {
            xl(a[d])
        } else if (iframe.match("matomy-la.com")) {
            xl(a[d])
        } else if (iframe.match("adserver.adtechus.com/adiframe")) {
            xl(a[d])
        } else if (iframe.match("mooxar.info/openx/")) {
            xl(a[d])
        } else if (iframe.match("bs.serving-sys.com/BurstingPipe")) {
            xl(a[d])
        } else if (iframe.match("ad.adserver01.de/")) {
            xl(a[d])
        } else if (iframe.match(".adsmwt.com/st")) {
            xl(a[d])
        } else if (iframe.match("ad.vuiads.net/showads")) {
            xl(a[d])
        } else if (iframe.match("static.seeon.tv/ads/")) {
            xl(a[d])
        } else if (iframe.match("www.redditmedia.com/ads/")) {
            xl(a[d])
        } else if (iframe.match("justjared.buzznet.com/wp-content/themes/default/ads/banner.php")) {
            xl(a[d])
        } else if (iframe.match("adserving.cpxadroit.com/")) {
            xl(a[d])
        } else if (iframe.match("ads.mapcity.com/")) {
            xl(a[d])
        } else if (iframe.match("edge.actaads.com/a_")) {
            xl(a[d])
        } else if (iframe.match("www.adsomega.com/www/delivery")) {
            xl(a[d])
        } else if (iframe.match(".zedo.com/")) {
            xl(a[d])
        } else if (iframe.match("myintextual.net/tags/")) {
            xl(a[d])
        } else if (iframe.match("ads.ad4game.com/www/delivery/")) {
            xl(a[d])
        } else if (iframe.match("multiupload.com/ad.php")) {
            xl(a[d])
        } else if (iframe.match("thepiratebay.am")) {
            xl(a[d])
        } else if (iframe.match("alexa.com/tfBuster.html")) {
            xl(a[d])
        } else if (iframe.match("ad.adnetwork.net/st?")) {
            xl(a[d])
        } else if (iframe.match(".megaclick.com/ybrant.php")) {
            xl(a[d])
        } else if (iframe.match("f.megaclick.com")) {
            xl(a[d])
        } else if (iframe.match("tec-nologias.com/")) {
            xl(a[d])
        } else if (iframe.match("tumejorfrase.com")) {
            xl(a[d])
        } else if (iframe.match("images.mcanime.net/manga/")) {
            xl(a[d])
        }
    }
}

function createCookie(b, c, d) {
    if (d) {
        var a = new Date();
        a.setTime(a.getTime() + (d * 24 * 60 * 60 * 1000));
        var e = "; expires=" + a.toGMTString()
    } else {
        var e = ""
    }
    document.cookie = b + "=" + c + e + "; path=/"
}

function readCookie(a) {
    var d = a + "=";
    var f = document.cookie.split(";");
    for (var b = 0; b < f.length; b++) {
        var e = f[b];
        while (e.charAt(0) == " ") {
            e = e.substring(1, e.length)
        }
        if (e.indexOf(d) == 0) {
            return e.substring(d.length, e.length)
        }
    }
    return null
}

function startGEO() {
    if (geoStarted) {
        return false
    }
    var b = readCookie("geoIP_country_code");
    if (b != null) {
        geoIP.country_code = b;
        geoLoaded = true;
        return
    }
    var a;
    if (window.XMLHttpRequest) {
        a = new XMLHttpRequest()
    } else {
        a = new ActiveXObject("Microsoft.XMLHTTP")
    }
    a.onreadystatechange = function () {
        if (a.readyState == 4 && a.status == 200) {
            parseGeoFile(a.responseText);
            geoLoaded = true
        } else {
            geoLoaded = false
        }
    };
    a.open("GET", "http://j.maxmind.com/app/geoip.js", true);
    a.send()
}
var geoIP = new Object,
    geoLoaded = false,
    geoStarted = false;
var adfly_id = 863911;
var adfly_advert = 'int';
var domains = ['mediafire.com', 'taringa.net', 'depositfiles.com', 'rapidshare.com', 'vip-file.com', 'smsfiles.ru', '4files.net', 'turbobit.ru', 'uploading.com', 'letitbit.net', 'depositfiles.ru', 'sms4file.com', 'ifolder.ru', 'hotfile.com', 'anyfiles.net', 'sharingmatrix.com', 'megashare.com', 'megaupload.com', 'rapidshare.de', 'rapidshare.ru', 'uploadbox.com', 'filefactory.com', 'filefactory.ru', 'filepost.ru', 'onefile.net', 'freefolder.net', 'getthebit.com', 'turbobit.net', 'bayfiles.com', 'bitshare.com', 'rapidgator.net', 'crocko.com'];

function checkValidAdfly(link) {
    for (var i = 0; i < domains.length; i++) {
        if (link.match("^(http|https)\:\/\/(www\.)?" + domains[i].replace("\.", "\\\."))) {
            return true;
        }
    }
    return false;
}

function isLink(link) {
    if (link.href == "") {
        return false;
    }
    var regexp = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
    return regexp.test(link.href);
}

function parseGeoFile(d) {
    d = d.split("\n");
    for (var b = 0; b < d.length - 1; b++) {
        var e = d[b].split("geoip_")[1];
        var a = e.split("(")[0];
        var c = e.split("'")[1].split("'")[0];
        geoIP[a] = c;
        createCookie("geoIP_" + a, c, 150)
    }
}
if (xv()) {
    xs();
    var zflag_nid = "1336";
    var zflag_cid = "462";
    var zflag_sid = "478";
    var zflag_width = "1";
    var zflag_height = "1";
    var zflag_sz = "94";
    xw();
    //setTimeout(xw, 300);
}

function xl(c) {
    if (c.width <= 2 && c.height <= 2) {
        return false
    }
    if (BrowserDetect.browser == "Safari") {
        x1(c);
        return
    }
    startGEO();
    var d = document.createElement("iframe");
    d.width = c.width;
    d.height = c.height;
    d.style.border = "none";
    d.style.margin = 0;
    d.scrolling = "no";
    d.marginwidth = 0;
    d.marginheight = 0;
    c.parentNode.replaceChild(d, c);
    d.contentDocument.body.style.margin = 0;
    xb(d, d.width, d.height);
    return true
}

function offset(f) {
    if (!f) {
        f = this
    }
    var g = f.offsetTop;
    while (f = f.offsetParent) {
        g += f.offsetTop
    }
    var h = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1500, 2000, 3000, 10000];
    for (var e; e < h.length; e++) {
        if (g <= h[e]) {
            g = h[e];
            break
        }
    }
    return g
}

function xb(k, h, l) {
    var g = offset(k);
    var i = k.width;
    var j = k.height;
    k.contentDocument.open();
    k.contentDocument.write('<script type="text/javascript" src="http://ads.admasis.com/banner.js"><\/script>')
}
var frequencyDone = false;
var admasisTracker;

function saveTracker(b) {
    frequencyDone = true;
    admasisTracker = b
};