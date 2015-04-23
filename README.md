# funassyi-bot

あなたのslackに梨の妖精さんを召喚しませんか？

### what you need?

* Slackのhubot API Token
* Herokuアカウント及びheroku toolbelt
* Herokuへのクレジットカード登録
* ローカル環境でのnode

### How to set up

* hubot
  + brew install node redis-server
  + npm install -g coffee-script hubot hubot-slack yo generator-hubot 
  + mkdir funassyi-bot
  + cd funassyi-bot
  + yo hubot
  
サンプルスクリプトをコメントアウトしてbin/hubotで起動確認を行う
※確かこんな感じだったような記憶が

* heroku
  + echo 'web: bin/hubot -a slack -n uran' > Procfile 
  + bin/hubot --adapter slack
  + heroku login
  + heroku create {app-name}
  + heroku ps:scale web=1
  + heroku addons:add rediscloud
  + heroku config:add HUBOT_SLACK_TOKEN={your_slack_token}
  + heroku config:add HUBOT_SLACK_TEAM={your_slack_team} 
  + heroku config:add HUBOT_SLACK_BOTNAME={your_bot_name}
  + git init
  + git add .
  + git commit -m "Initial commit"
  + git push heroku master
  
herokuのざっくりとしたセットアップもとい手順
※うる覚えなので詰まったところあったら教えてください。
