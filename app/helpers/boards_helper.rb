module BoardsHelper
  def player_records(players, records)
    new_records = {}
    players.each do |player|
      if player.anonymous?
        new_records[player.anonymous] = []
      else
        new_records[player.player.name] = []
      end
    end

    records.each do |record|
      if record.anonymous?
        new_records[record.anonymous].push(record.score)
      else
        new_records[record.player.name].push(record.score)
      end
    end

    new_records
  end
end
