class Market < ActiveRecord::Base
  def self.accepts_benefits
    where('fnap IS NOT NULL OR snap_option IS NOT NULL')
  end
end