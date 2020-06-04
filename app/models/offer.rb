class Offer < ApplicationRecord
  validates :url, format: {
    with: /\Ahttps*:\/\/\w+(\.\w{2,4})+\/?\z/,
    allow_blank: true
  }

  scope :published, -> do 
    where('enabled = ? AND url IS NOT NULL AND start_at <= ? AND end_at >= ?', true, Time.zone.now, Time.zone.now)
      .order(premium: :desc, start_at: :desc)
  end
end
