class Admin::AdminsController < ApplicationController
  before_filter :authenticate_person! , :only => [:show_admin_dashboard, :show_admin_dashboard_business ]
  def home

  end

  def show_admin_dashboard
    if current_person.admin?
      @admin=Person.find(current_person.id)
      @causes=Cause.all
    end
  end

  def show_admin_dashboard_business
    if current_person.admin?
      @admin=current_person
      @business= BusinessCompany.all

    end
  end

  def view_donation

    causes = Cause.all
    cost_count = Array.new
    @cause_list = Array.new
    cause_fund_hash = Hash
    causes.each do |cause|
      businesses = cause.business_companies
      business_post = Post.find_all_by_business_company_id(businesses.collect{|i| i.id})
      imp_count = Impression.find_all_by_post_id(business_post.collect{|j|j.id })
      cost_count.push(imp_count.count)

      cost_count.each{|c| sum = sum.to_f + c.to_f}
      sum = sum.to_f * FUND_SEND.to_f
      cause_fund_hash = {"cause" => cause, "total_fund" => sum}
      @cause_list.push(cause_fund_hash)
    end
  end

  def get_businesses_admin
    @business_cause_money = Array.new
    cause = Cause.find(params[:cause])
    businesses = cause.business_companies
    imp_hash = Hash.new

    businesses.each do |b|

      posts = Post.find_all_by_business_company_id(b.id)
      cost_count = (Impression.find_all_by_post_id(posts.collect{|j|j.id })).count
      cost_count = cost_count * FUND_SEND
      imp_hash = {"business_name" => b.business_name, "business_impression" => cost_count}
      @business_cause_money.push(imp_hash)
    end

    respond_to do |format|
      format.js
    end

  end
end
