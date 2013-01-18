module UsersHelper

  def count_businesses(cause)
    @business_count=cause.business_companies.size
  end
  def businesses_of_causes(cause)
    businesses = cause.business_companies
    #@business_first=businesses.first.business_name
    @business_first=businesses.all.business_name
  end


end

