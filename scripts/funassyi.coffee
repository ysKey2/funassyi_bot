module.exports = (robot) ->

  robot.hear /(.*)おーい(.*)/i, (res) ->
    res.send res.random([
      "なにか用なっし〜？",
       "どうしたなっし〜？",
       "ふなっしーは忙しいなっしーよ！"
    ])
  robot.hear /(.*)おやすみ(.*)/i, (res) ->

    res.send res.random([
      "おやすみなっしー！",
       "いい夢見るなっしーよ！",
       "ふなっしーも梨の葉ベッドで寝るなっしー！"
    ])

  robot.hear /(.*)なし(.*)/i, (res) ->
    res.send res.random([
      "梨汁ぶっしゃー！！！",
       "なっしーなっしー！！",
       "ふなっしー！"
    ])

  robot.hear /(.*)眠い(.*)/i, (res) ->
    res.send res.random([
      "起きるなっしー！",
       "お疲れなっしーね！一息つくなっし？",
       "外で大ジャンプすれば目が覚めるなっしーよ！"
    ])

  robot.hear /(.*)疲れた(.*)/i, (res) ->
    res.send res.random([
      "まだまだこれからなっしーよ！！",
       "無理はしちゃダメなっしー！",
       "梨でも食べて元気になるなっしー！"
    ])

  robot.hear /(.*)お疲れ様(.*)/i, (res) ->
    res.send "今日も1日お疲れ様なっしー！"

  robot.hear /(.*):ramen:(.*)/i, (res) ->
    res.send ":ramen:"

   robot.hear /(.*)暑い(.*)/i, (res) ->
     res.send res.random([
       "今日は暑いなっしー！",
       "今日は暑いなっしー！",
       "ふなっしーは梨の妖精だから暑さは平気なっしー！",
       "ふなっしーも暑さで梨汁ぶっしゃー！"
     ])

  robot.hear /(.*)ボンバーマン(.*)/i, (res) ->
    res.send res.random([
      "1Pはアイテムが出にくいって昔聞いた事があるなっしー！",
       "マルチタップ持ってる人は皆強いなっしー！"
    ])

  robot.hear /(.*)コーヒー(.*)/i, (res) ->
    res.send res.random([
      "コーヒーより梨汁なっしーよ！！",
       "セブンイレブンのコーヒーはなかなかなっしーね！",
       "ローソンのコーヒーはもう一歩なっしー！"
    ]) 

  robot.hear /(.*)梨汁(.*)/i, (res) ->
    res.send res.random([
      "ひゃっはー！！！！",
       "ぶっしゃー！！！！！",
    ])

  robot.hear /(.*)住所(.*)/i, (res) ->
    res.send "〒150-0042 東京都渋谷区宇田川町36-6 ワールド宇田川ビル 6F A号 なっしー"

  robot.hear /(.*)の天気/i, (msg) ->
    switch msg.match[1]
      when '今日'
        day = 0
      when '明日'
        day = 1
      when '明後日'
        day = 2
      else
        day = 3
        break
    request = msg.http('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    .get()
    request (err, res, body) ->
      json = JSON.parse body
      if day == 3 then forecast = 'わから' else forecast = json['forecasts'][day]['telop']
      msg.reply forecast + 'なっしー！'
