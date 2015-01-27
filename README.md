Newspaper Boy
=============

Delivery newspaper to your kindle everyday!

<a target="_blank" href="https://cloud.githubusercontent.com/assets/690703/5707093/dca645aa-9ac0-11e4-9318-2597cc4ad69a.png"><img width="350px;" src="https://cloud.githubusercontent.com/assets/690703/5707093/dca645aa-9ac0-11e4-9318-2597cc4ad69a.png"></a>
<a target="_blank" href="https://cloud.githubusercontent.com/assets/690703/5707097/e169382c-9ac0-11e4-89bf-fbbc862d70cd.png"><img width="350px;" src="https://cloud.githubusercontent.com/assets/690703/5707097/e169382c-9ac0-11e4-89bf-fbbc862d70cd.png"></a>

[![](http://dockeri.co/image/zack/newspaper-boy)](https://registry.hub.docker.com/u/zack/newspaper-boy/)

Prerequisite
------------
    $ apt-get update && apt-get install -y calibre

Quick Start
-----------

    $ echo "your@kinlde.com" > emails.txt
    $ API_KEY=GET_YOUR_OWN_KEY_FROM_MANDRILL \
      SENDER="newspaper@yulun.me" \
      RECIPE="appledaily_tw" \
      EMAILS="emails.txt"
      ./thorw.sh


PS. Don't forget set sender in your own [Approved Personal Document E-mail List](http://www.amazon.com/gp/help/customer/display.html/ref=hp_pdoc_main_short_us?nodeId=200767340#GUID-0A6C24BA-AE01-45F1-8D3A-2557A7B1DE31)

Variables
---------
- **API_KEY** Your MANDRILL API Key for sends email.
- **SENDER** Send as `someone@somewhere.com`.
- **RECIPE** Loads Calibre recipe from `./recipes` directory.
- **EMAILS** List of Receivers' email. (lines are separated by newlines)

Reference
---------
- **MANDRILL** https://mandrillapp.com/api/docs/
- **Calibre** http://manual.calibre-ebook.com/news.html
- **Calibre Recipes** https://github.com/kovidgoyal/calibre/tree/master/recipes

License
-------
GNU General Public License v3.0
