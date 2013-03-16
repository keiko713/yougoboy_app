#
# Choose random num elements from array
#
sample = (array, num) ->
  return null if array.length == 0 or num == 0
  num = array.length if array.length < num
  result = []
  n = array.length
  while result.length < num - 1
    result.push(array.splice(Math.floor(Math.random()*array.length), 1)[0])
  # push the last one
  result.push(array[Math.floor(Math.random()*array.length)])
  result

#
# New game
#
newgame = () ->
  $.ajax '/words',
    type: 'GET'
    dataType: 'json'
    success: (words) ->
      arr = sample(words, 6)
      answer = arr[Math.floor(Math.random()*arr.length)]
      data = {
        audiosrc: "https://ssl.gstatic.com/dictionary/static/sounds/de/0/#{answer.name.toLowerCase()}.mp3" # alternative: "http://tts-api.com/tts.mp3?q=#{answer.name}"
        question: "Which is one #{answer.name}?"
        candidates: (word.name.toLowerCase() for word in arr)
      }
      questionContent = HandlebarsTemplates['question_content'](data)
      $('.question-content').html(questionContent)
      # add event listener
      $('.game .span-player img').click( ()->
        if $(this).data('name') == answer.name.toLowerCase()
          $('#gameModalImg').attr('src', "/assets/pass#{Math.floor(Math.random()*4)}.png")
          $('#gameModal').modal('show')
          setTimeout(() ->
            $('#gameModal').modal('hide')
            newgame()
          , 1000)
        else
          $('#gameModalImg').attr('src', "/assets/fail#{Math.floor(Math.random()*4)}.png")
          $('#gameModal').modal('show')
          setTimeout(() ->
            $('#gameModal').modal('hide')
          , 1000)
      )
      $('.speaker').click( ()->
        $('.question-bar audio')[0].play()
      )
      $('.game').show()
      $('.question-bar audio')[0].play()


#
# Choose a player
#
$('.player-img').click( ()->
  kidId = $(this).data('kid-id')
  $('.welcome').hide()
  $.ajax "/kids/#{kidId}",
    type: 'GET'
    dataType: 'json'
    success: (kid) ->
      urlPattern = new RegExp("(http|https)://.*")
      imgsrc = if kid.charactor_img.match(urlPattern) then kid.charactor_img else "/assets/#{kid.charactor_img}"
      data = {
        id: kid.id
        imgsrc: kid.charactor_img
        name: kid.name
      }
      playerBar = HandlebarsTemplates['player_bar'](data)
      $('.game').html(playerBar)
      newgame()
)
