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

class AlbumsController < ApplicationController
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def index
    render :index
  end
end
