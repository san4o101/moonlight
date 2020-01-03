module BillsHelper

  def card_date_expired(date)
    date.strftime('%m/%Y') if date.present?
  end

  def card_number_format(card_number)
    card_number.scan(/.{1,4}/).join(' ')
  end

  def hidden_card_number_format(card_number)
    '●●●● ' + card_number.last(4)
  end

end
