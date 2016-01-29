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

require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
