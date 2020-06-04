class Offer < ApplicationRecord
  scope :published, -> do 
    where('enabled = ? AND url IS NOT NULL AND start_at <= ? AND end_at >= ?', true, Time.zone.now, Time.zone.now)
      .order(premium: :desc, start_at: :desc)
  end
end
