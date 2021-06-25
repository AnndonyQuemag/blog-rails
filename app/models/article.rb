class Article < ApplicationRecord
    validates :title, presence: true #title value must contain at least one non-whitespace character.
    validates :body, presence: true, length: { minimum: 8 } #body must also be present a value. Also, declare that the bodyvalue must be at least 10 characters long.
end
