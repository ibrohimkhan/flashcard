class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  scope :for_review, -> (date) { where("review_date <= ?", date).first }

  def check_translation?(user_translated_text)
    translated_text == user_translated_text
  end

  def update_attribute
    self.review_date += 3.day
    save
  end
end