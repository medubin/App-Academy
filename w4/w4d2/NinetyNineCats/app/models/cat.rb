# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Cat < ActiveRecord::Base
  COLORS = %w[white black tabby green orange calico grey gray]
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :color, inclusion: { in: COLORS }, presence: true
  validates :sex, inclusion: { in: %w[M F] }, presence: true

  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "CatRentalRequest"

  def age
    (Date.today - birth_date).to_i/365
  end








end
