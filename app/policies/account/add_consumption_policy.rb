class Account::AddConsumptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def create?
	  puts "Record #{record.account_id}"
    current_user.admin? or 
      (Account.find(record.account_id).user_id == current_user.id and
        current_user.id == ConsumptionType.find(record.consumption_type_id).user_id)
  end
end
