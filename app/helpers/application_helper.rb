module ApplicationHelper
  def format_card_date(date)
    day = date.day <= 9 ? ('0' + date.day.to_s) : date.day.to_s
    month = date.month <= 9 ? ('0' + date.month.to_s) : date.month.to_s
    year = date.year.to_s

    day + '/' + month + '/' + year
  end
end
