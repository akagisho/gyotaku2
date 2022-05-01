class Folder < ApplicationRecord
  has_many :urls, dependent: :destroy
end
