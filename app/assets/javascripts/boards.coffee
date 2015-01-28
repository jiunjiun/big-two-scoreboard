# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  initialize = ->
    $('input#board_player_anonymous').keyup ->
      anonymous = $(this).val().trim()
      unless anonymous
        $('.players').addClass('hide')
        $('input#board_player_player_id').val('')
      else
        $.ajax
          dataType: "json"
          url: '/boards/search'
          data: {name: anonymous}
          success: (data) ->
            $('.messages-list').html('')
            $('.players').removeClass('hide') if data.result.length > 0

            $.each data.result, (key, val) ->
              message = $('#new_player .message.sample').clone().removeClass('sample').removeClass('hide')
              message.find('.message-avatar').attr('src', "http://graph.facebook.com/v2.2/#{val.fid}/picture?type=normal")
              message.find('.message-subject').html(val.name)
              message.attr('data-uid', val.id)

              message.appendTo('.messages-list')

    $(document).on "click", ".messages-list > .message", (event) ->
      message = $(this)
      $('#board_player_player_id').val(message.data('uid'))
      $('input#board_player_anonymous').val(message.find('a').html())
      $('.players').addClass('hide')

    $('#new_player').on 'hidden.bs.modal', ->
      $('.players').addClass('hide')
      $('input#board_player_anonymous').val('')
      $('input#board_player_player_id').val('')

    # --





  $(document).ready(initialize)
  $(document).on('page:load', initialize)