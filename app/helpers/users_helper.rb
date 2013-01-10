module UsersHelper
  def count_businesses(cause)
    @business_count=cause.business_companies.count
  end
  def count_users_of_businesses(business)
    @user_count=business.business_has_users.count
  end
end
