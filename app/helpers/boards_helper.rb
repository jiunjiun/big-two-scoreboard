module BoardsHelper
  def board_player_name(board_player)
    if board_player.anonymous
      board_player.anonymous
    else
      board_player.player.name
    end
  end

  def options_from_wager(wager)
    result = []
    Array(-200..200).each {|num| result.push([num * wager, num * wager]) }
    options_for_select(result, 0)
  end

  def recored_transform(bps, records)
    new_records = []
    bps_arr = []

    bps.each { |bp| bps_arr.push(bp.id) }

    record_arr = Array.new(bps.size, 0)
    cr = tmp_cr = nil
    records.each_with_index do |record, i|
      cr = record.created_at
      tmp_cr = record.created_at if i == 0

      if cr.to_s != tmp_cr.to_s
        tmp_cr = record.created_at
        new_records.push(record_arr)
        record_arr = Array.new(bps.size, 0)
      end
      record_arr[bps_arr.index(record.board_player_id)] = record.score
    end
    new_records.push(record_arr)
  end
end
