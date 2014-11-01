module ApplicationHelper
  def format_card_date(date)
    day   = date.day.to_s.rjust(2, '0')
    month = date.month.to_s.rjust(2, '0')
    year  = date.year.to_s

    [day, month, year].join('/')
  end
end
