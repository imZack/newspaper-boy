Newspaper Boy
=============

Delivery newspaper to your kindle everyday!

<a target="_blank" href="https://cloud.githubusercontent.com/assets/690703/5707093/dca645aa-9ac0-11e4-9318-2597cc4ad69a.png"><img width="350px;" src="https://cloud.githubusercontent.com/assets/690703/5707093/dca645aa-9ac0-11e4-9318-2597cc4ad69a.png"></a>
<a target="_blank" href="https://cloud.githubusercontent.com/assets/690703/5707097/e169382c-9ac0-11e4-89bf-fbbc862d70cd.png"><img width="350px;" src="https://cloud.githubusercontent.com/assets/690703/5707097/e169382c-9ac0-11e4-89bf-fbbc862d70cd.png"></a>

Prerequisite
------------
    $ apt-get update && apt-get install -y calibre

Quick Start
-----------

    $ git clone https://github.com/imZack/newspaper-boy.git && cd newspaper-boy
    $ echo "your@kinlde.com" > emails.txt
    $ API_KEY=GET_FROM_MANDRILL ./thorw.sh

PS. Don't forget set sender in your own [Approved Personal Document E-mail List](http://www.amazon.com/gp/help/customer/display.html/ref=hp_pdoc_main_short_us?nodeId=200767340#GUID-0A6C24BA-AE01-45F1-8D3A-2557A7B1DE31)

Reference
---------
- **MANDRILL** https://mandrillapp.com/api/docs/
- **Calibre** http://manual.calibre-ebook.com/news.html
- **Calibre Recipes** https://github.com/kovidgoyal/calibre/tree/master/recipes

License
-------
[MIT](http://yulun.mit-license.org/)
