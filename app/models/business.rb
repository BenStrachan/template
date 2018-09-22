# == Schema Information
#
# Table name: businesses
#
#  id            :bigint(8)        not null, primary key
#  business_name :string
#  first_name    :string
#  last_name     :string
#  phone         :string
#  email         :string
#  address       :string
#  city          :string
#  state         :string
#  country       :string
#  author_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  time_zone     :string
#

class Business < ApplicationRecord
  has_many :users, dependent: :destroy
end
