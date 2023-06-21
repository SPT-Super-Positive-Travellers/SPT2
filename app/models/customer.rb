class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    last_name + first_name
  end

  def cus_status
    if is_deleted == false
      "有効"
    else
      "退会"
    end
  end
end
