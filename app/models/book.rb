class Book < ApplicationRecord
        validates_uniqueness_of :title, scope: :user_id
        validates :title, presence: true
        validates_length_of :title, maximum: 30, message: "-El nombre del cuaderno no puede superar los 30 caracteres"
        belongs_to :user   
        has_many :notes, dependent: :destroy
        accepts_nested_attributes_for :notes
end
