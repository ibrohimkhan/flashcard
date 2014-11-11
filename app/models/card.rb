class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  scope :get_card, -> (date) { where("review_date <= ?", date).first }

  def translated?(user_translated_text)
    translated_text == user_translated_text
  end
end