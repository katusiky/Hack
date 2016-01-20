json.extract! @client, :name, :telephone_number, :address
json.bill do
	json.total_amount @client.checks.last.total_amount
	json.name @client.checks.last.items.each do |a|
		a.name
	end
end