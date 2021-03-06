class Identity < ActiveRecord::Base
  belongs_to :player

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
