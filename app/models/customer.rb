class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :postal_code, :province_id

  belongs_to :province
  has_many :orders

  validates :address, :city, :country, :first_name, :last_name, :presence => true
  validates :postal_code, :presence => true,
                          :format => { :with => /^([AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvXxYy]\d[AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvWwXxYyZz]\s?\d[AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvWwXxYyZz]\d)|(\d{5}(-\d{4})?)$/,
                                       :message => 'Invalid Postal/Zip Code' }
  validates :email,       :format => { :with => /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
                                       :message => 'Invalid Email Address' }
  validates :province_id, :presence => true,
                          :numericality => { :only_integer => true }

end