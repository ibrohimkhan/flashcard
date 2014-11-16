class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  scope :for_review, -> (date) { where("review_date <= ?", date).order("RANDOM()") }

  def check_translation(user_translated_text)
    translated_text == user_translated_text
  end

  def update_review_date(value)
    update_attribute(:review_date, value)
  end
end