# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def short(text)
    truncate(text, :length => 40, :omission => "(...)")
  end
end
