class User < ActiveRecord::Base
  has_many :items
  has_many :categories
  has_many :comments
end
