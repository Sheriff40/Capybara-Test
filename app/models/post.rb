# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  price      :integer
#  gender     :integer
#  hobby      :string
#  foods      :text             default([]), is an Array
#  sus_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null

class Post < ApplicationRecord

  enum gender: [:male,:female]

  has_one_attached :image

end
