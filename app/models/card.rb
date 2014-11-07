class Card < ActiveRecord::Base
  attr_accessor :user_translation
  validates :original_text, :translated_text, presence: true

  scope :first_card, -> (date) { where("review_date <= ?", date).first }
  scope :next_card, -> (date, card_id) { where("review_date <= ? and id > ?", date, card_id).first }

  def found_translation?(user_translated_text)
    if self.translated_text == user_translated_text
      self.review_date += 3.day
      return true if self.save
    else
      return false
    end
  end
end