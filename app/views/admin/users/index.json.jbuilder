json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :full_name, :email, :location, :bio
  json.url admin_user_url(admin_user, format: :json)
end
