class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  def self.find_sti_class(type_name)
    {
      'Cashier': Cashier,
      'Client': Client,
      'Manager': Manager,
      'Waiter': Waiter
    }[type_name.to_sym]
  end
end
