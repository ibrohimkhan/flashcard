class Card < ActiveRecord::Base
  attr_accessor :user_translation
  validates :original_text, :translated_text, presence: true

  @@counter = -1
  scope :first_card, -> (date) { @@counter = 0; where("review_date <= ?", date).first }
  scope :next_card, -> (date) { where("review_date <= ?", date).limit(1).offset(@@counter += 1) }

  def translated?(user_translated_text)
    if self.translated_text == user_translated_text
      self.review_date += 3.day
      self.save
    else
      return false
    end
  end
end