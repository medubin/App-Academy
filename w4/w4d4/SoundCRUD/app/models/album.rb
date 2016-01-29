# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  record_type :string           not null
#  band_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base

  validates(
    :title,
    :record_type,
    :band_id,
    presence: true )

  validates(
    :record_type,
    inclusion: %w[live studio] )

  belongs_to :band
  has_many :tracks, dependent: :destroy



end
