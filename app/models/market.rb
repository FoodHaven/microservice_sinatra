class Market < ActiveRecord::Base
  def self.accepts_benefits
    available('fnap IS NOT NULL OR snap_option IS NOT NULL')
  end

  def self.snap_available
    available('snap_option IS NOT NULL')
  end

  def self.fnap_available
    available('fnap IS NOT NULL')
  end
  
  private

  def self.available(condition)
    where(condition)
  end
end