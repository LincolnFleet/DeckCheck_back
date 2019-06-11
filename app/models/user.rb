class User < ApplicationRecord
    has_many    :decks

    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}
end
