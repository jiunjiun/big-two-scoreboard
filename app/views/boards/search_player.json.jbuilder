json.result @players do |player|
  json.id    player.id
  json.fid   player.username
  json.name  player.name
end