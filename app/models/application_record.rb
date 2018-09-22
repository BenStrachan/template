class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
end
