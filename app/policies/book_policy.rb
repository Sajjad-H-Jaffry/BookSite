class BookPolicy < ApplicationPolicy
  class Scope < Scope
    
    def resolve   
      scope.where(published: true).or(scope.where(user_id: @user.try(:id)))
    end
  
  end 
  
  def new? 
    user_is_owner_of_book?  
  end

  def create?  
    user_is_owner_of_book?  
  end

  def show? 
    user = @record
  end
 
  def  update?  
    user_is_owner_of_book?  
  end
 
  def delete?  
    user_is_owner_of_book?  
  end
    
  private
  
    def user_is_owner_of_book?
      user == @record.user
    end
    
    def allowed_all?
      user = @record
    end

end
