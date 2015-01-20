class Game < ActiveRecord::Base
  as_enum :identity, [:master, :general], source: :identity
end
