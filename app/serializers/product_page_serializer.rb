class ProductPageSerializer
  include JSONAPI::Serializer
  attributes :user_id, :title, :description, :created_at, :slug, :weekly_views
end
