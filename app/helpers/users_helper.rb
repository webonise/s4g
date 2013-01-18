module UsersHelper
  def count_businesses(cause)
    @business_count=cause.business_companies.count
  end
  def count_users_of_businesses(business)
    @user_count=business.business_has_users.count
  end
  def businesses_of_causes(cause)
    businesses = cause.business_companies
    #@business_first=businesses.first.business_name
    @business_first=businesses.all.business_name
    #@business_name = []
    #"#{businesses.limit(2).each do |i|
    # @business_name.push(i.business_name)
    #end
    # return @business_name
    #---------------------------
    #@business_first = businesses[0].business_name
    #@business_last = businesses[1].business_name
    #return @business_first, @business_last
  end


end

