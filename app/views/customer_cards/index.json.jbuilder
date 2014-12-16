json.array!(@customer_cards) do |customer_card|
  json.extract! customer_card, :id
  json.url customer_card_url(customer_card, format: :json)
end
