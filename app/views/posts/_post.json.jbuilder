json.extract! post, :id, :title, :type, :status, :created_at, :updated_at
json.url post_url(post, format: :json)
