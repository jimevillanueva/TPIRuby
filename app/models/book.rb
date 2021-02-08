class Book < ApplicationRecord
        validates_uniqueness_of :title, scope: :user_id
        validates :title, presence: true
        belongs_to :user   
        has_many :notes, dependent: :destroy
        accepts_nested_attributes_for :notes
end
