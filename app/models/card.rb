class Card < ActiveRecord::Base
  attr_accessor :user_translation
  validates :original_text, :translated_text, presence: true

  scope :first_card, -> (date) { where("review_date <= ?", date).first }
  scope :next_card, -> (date, card_id) { where("review_date <= ? and id > ?", date, card_id).first }
  scope :find_translation, -> (original_text, translated_text) { where("original_text = ? and translated_text = ?",
                                                                       original_text, translated_text) }
end