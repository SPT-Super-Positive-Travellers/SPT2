class Destination < ApplicationRecord
  
  belongs_to :customer
  
  def full_des
    '〒' + postal_code + '' + address + '' + name
  end
end
