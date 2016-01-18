json.array!(@anyshits) do |anyshit|
  json.extract! anyshit, :id
  json.url anyshit_url(anyshit, format: :json)
end
