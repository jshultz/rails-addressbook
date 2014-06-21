json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :street2, :city, :state, :zip, :phone
  json.url address_url(address, format: :json)
end
