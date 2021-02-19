class Note < ApplicationRecord
has_rich_text :content
belongs_to :book
validates_length_of :title, maximum: 50, message: "-el nombre de la nota no puede superar los 30 caracteres"
end
