class Account::TransferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def create?

    current_user.admin? or 
      (Account.find(record.account_id).user_id == Account.find(record.destination_id).user_id and 
        current_user.id == Account.find(record.destination_id).user_id)
  end
end
