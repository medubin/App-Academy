# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, inclusion: { in: %w[PENDING APPROVED DENIED] }, presence: true
  validates :overlapping_approved_requests.length == 0

  belongs_to :cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "Cat"

    def overlapping_requests
      CatRentalRequest.where(cat_id: self.cat_id).where((self.start_date - end_date) * (start_date - self.end_date) < 0)
    end

    def overlapping_approved_requests
      overlapping_requests.where(status: "APPROVED")#.length > 1
    end



end
