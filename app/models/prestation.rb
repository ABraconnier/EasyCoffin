class Prestation < ApplicationRecord
  belongs_to :mourner
  belongs_to :client
end
