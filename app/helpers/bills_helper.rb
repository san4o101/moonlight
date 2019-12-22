module BillsHelper

  def card_date_expired(date)
    date.strftime('%m/%Y') if date.present?
  end

end
