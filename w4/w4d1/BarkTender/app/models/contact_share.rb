class ContactShare < ActiveRecord::Base
    validates :contact_id, presence: true
    validates :user_id, presence: true

    belongs_to :contacts,
      foreign_key: :contact_id,
      primary_key: :id,
      class_name: "Contact"

    belongs_to :users,
      foreign_key: :user_id,
      primary_key: :id,
      class_name: "User"


end
