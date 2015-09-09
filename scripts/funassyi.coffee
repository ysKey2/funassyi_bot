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

  robot.hear /(.*)電話(.*)/i, (res) ->
    res.send "TEL 03-6667-4345 FAX 03-4333-0428 なっしー"

  robot.hear /(.*)りょーすけべー(.*)/i, (res) ->
    res.send "@ryo_sk: りょーすけくんはすけべなっしー!"

  robot.hear /(.*)りょうすけべー(.*)/i, (res) ->
    res.send "@ryo_sk: りょうすけくんはどスケベなっしー!!"

  robot.hear /(.*)ゴミ出し(.*)/i, (res) ->
    res.send "可燃：水曜日・土曜日\n不燃ごみ：第3月曜日、\n資源：火曜日"

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

  robot.hear /(.*)の画像/i, (msg) ->
    imageMe msg, msg.match[1], (url) ->
      msg.send url

imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image = msg.random images
        cb ensureImageExtension image.unescapedUrl

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
