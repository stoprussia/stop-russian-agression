require "json"
require "open-uri"

module RConfig
  def self.load_proxies
    # path =  File.expand_path("../../../assets/Free_Proxy_List.json", __FILE__)
    path = "https://proxylist.geonode.com/api/proxy-list?limit=50&page=1&sort_by=lastChecked&sort_type=desc&protocols=http%2Chttps"
    uri = URI.parse(path)
    response = JSON.parse(uri.read, symbolize_names: true)
    response[:data] # .select { |el| el[:protocols].include?("https") || el[:protocols].include?("https") }
  rescue
    []
  end

  def self.referrers
    [
      "http://www.google.com/?q=",
      "http://yandex.ru/yandsearch?text=%D1%%D2%?=g.sql()81%..",
      "http://vk.com/profile.php?redirect=",
      "http://www.usatoday.com/search/results?q=",
      "http://engadget.search.aol.com/search?q=query?=query=..",
      "https://www.google.ru/#hl=ru&newwindow=1?&saf..,or.r_gc.r_pw=?.r_cp.r_qf.,cf.osb&fp=fd2cf4e896a87c19&biw=1680&bih=882",
      "https://www.google.ru/#hl=ru&newwindow=1&safe..,or.r_gc.r_pw.r_cp.r_qf.,cf.osb&fp=fd2cf4e896a87c19&biw=1680&bih=925",
      "http://yandex.ru/yandsearch?text=",
      "https://www.google.ru/#hl=ru&newwindow=1&safe..,iny+gay+q=pcsny+=;zdr+query?=poxy+pony&gs_l=hp.3.r?=.0i19.505.10687.0.10963.33.29.4.0.0.0.242.4512.0j26j3.29.0.clfh..0.0.dLyKYyh2BUc&pbx=1&bav=on.2,or.r_gc.r_pw.r_cp.r_qf.,cf.osb&fp?=?fd2cf4e896a87c19&biw=1389&bih=832",
      "http://go.mail.ru/search?mail.ru=1&q=",
      "http://nova.rambler.ru/search?=btnG?=%D0?2?%D0?2?%=D0..",
      "http://ru.wikipedia.org/wiki/%D0%9C%D1%8D%D1%x80_%D0%..",
      "http://ru.search.yahoo.com/search;_yzt=?=A7x9Q.bs67zf..",
      "http://ru.search.yahoo.com/search;?_query?=l%t=?=?A7x..",
      "http://go.mail.ru/search?gay.ru.query=1&q=?abc.r..",
      "http://nova.rambler.ru/search?btnG=%D0%9D%?D0%B0%D0%B..",
      "http://www.google.ru/url?sa=t&rct=?j&q=&e..",
      "http://help.baidu.com/searchResult?keywords=",
      "http://www.bing.com/search?q=",
      "https://www.yandex.com/yandsearch?text=",
      "https://duckduckgo.com/?q=",
      "http://www.ask.com/web?q=",
      "http://search.aol.com/aol/search?q=",
      "https://www.om.nl/vaste-onderdelen/zoeken/?zoeken_term=",
      "https://drive.google.com/viewerng/viewer?url=",
      "http://validator.w3.org/feed/check.cgi?url=",
      "http://host-tracker.com/check_page/?furl=",
      "http://www.online-translator.com/url/translation.aspx?direction=er&sourceURL=",
      "http://jigsaw.w3.org/css-validator/validator?uri=",
      "https://add.my.yahoo.com/rss?url="
    ]
  end

  def self.user_agents
    [
      "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.1 (KHTML, like Gecko) Chrome/4.0.219.6 Safari/532.1",
      "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; InfoPath.2)",
      "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.5.30729; .NET CLR 3.0.30729)",
      "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.2; Win64; x64; Trident/4.0)",
      "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; SV1; .NET CLR 2.0.50727; InfoPath.2)",
      "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)",
      "Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)",
      "Opera/9.80 (Windows NT 5.2; U; ru) Presto/2.5.22 Version/10.51",
      "AppEngine-Google; (+http://code.google.com/appengine; appid: webetrex)",
      "Mozilla/5.0 (compatible; MSIE 9.0; AOL 9.7; AOLBuild 4343.19; Windows NT 6.1; WOW64; Trident/5.0; FunWebProducts)",
      "Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.7; AOLBuild 4343.27; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)",
      "Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.7; AOLBuild 4343.21; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E)",
      "Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.7; AOLBuild 4343.19; Windows NT 5.1; Trident/4.0; GTB7.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)",
      "Mozilla/4.0 (compatible; MSIE 8.0; AOL 9.7; AOLBuild 4343.19; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E)",
      "Mozilla/4.0 (compatible; MSIE 7.0; AOL 9.7; AOLBuild 4343.19; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET4.0C; .NET4.0E)",
      "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.3) Gecko/20090913 Firefox/3.5.3",
      "Mozilla/5.0 (Windows; U; Windows NT 6.1; ru; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3 (.NET CLR 2.0.50727)",
      "Mozilla/5.0 (Windows; U; Windows NT 5.2; de-de; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3 (.NET CLR 3.5.30729)",
      "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.1) Gecko/20090718 Firefox/3.5.1 (.NET CLR 3.0.04506.648)",
      "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E",
    ]
  end

  def self.targets
    [
      "https://www.gazprom.ru/",
      "https://lukoil.ru",
      "https://magnit.ru/",
      "https://www.nornickel.com/",
      "https://www.surgutneftegas.ru/",
      "https://www.tatneft.ru/",
      "https://www.evraz.com/ru/",
      "https://nlmk.com/",
      "https://www.sibur.ru/",
      "https://www.severstal.com/",
      "https://www.metalloinvest.com/",
      "https://nangs.org/",
      "https://rmk-group.ru/",
      "https://www.tmk-group.ru/",
      "https://www.polymetalinternational.com/",
      "https://www.uralkali.com/",
      "https://www.eurosib.ru/",
      "https://omk.ru/",
      "https://www.sberbank.ru/",
      "https://www.vtb.ru/",
      "https://www.gazprombank.ru/",
      "https://www.gosuslugi.ru/",
      "https://www.mos.ru/uslugi/",
      "http://kremlin.ru/",
      "http://government.ru/",
      "https://mil.ru/",
      "https://www.nalog.gov.ru/",
      "https://customs.gov.ru/",
      "https://pfr.gov.ru/",
      "https://rkn.gov.ru/",
      "https://www.gosuslugi.ru/",
      "https://www.mos.ru/",
      "http://kremlin.ru/",
      "http://government.ru/",
      "https://mil.ru/",
      "https://www.nalog.gov.ru/",
      "https://customs.gov.ru/",
      "https://pfr.gov.ru/",
      "https://rkn.gov.ru/",
      "https://www.sberbank.ru",
      "https://www.vtb.ru/",
      "https://www.gazprombank.ru/",
      "https://www.gazprom.ru/",
      "https://lukoil.ru",
      "https://magnit.ru/",
      "https://www.nornickel.com/",
      "https://www.surgutneftegas.ru/",
      "https://www.tatneft.ru/",
      "https://www.evraz.com/",
      "https://nlmk.com/",
      "https://www.sibur.ru/",
      "https://www.severstal.com/",
      "https://www.metalloinvest.com/",
      "https://nangs.org/",
      "https://rmk-group.ru/",
      "https://www.tmk-group.ru/",
      "https://www.polymetalinternational.com/",
      "https://www.uralkali.com/",
      "https://www.eurosib.ru/",
      "https://omk.ru/",
      "https:/ria.ru",
      "https:/gazeta.ru",
      "https:/kp.ru",
      "https:/riafan.ru",
      "https:/pikabu.ru",
      "https:/kommersant.ru",
      "https:/mk.ru",
      "https:/yaplakal.com",
      "https:/rbc.ru",
      "https:/bezformata.com",
    ]
  end
end
