module ApplicationHelper
  def format_card_date(date)
    day = date.day <= 9 ? date.day.to_s.rjust(2, '0') : date.day.to_s
    month = date.month <= 9 ? date.month.to_s.rjust(2, '0') : date.month.to_s
    year = date.year.to_s

    [day, month, year].join('/')
  end
end
