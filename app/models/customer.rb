class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :postal_code, :province_id
  belongs_to :province
  has_many :orders
  validates :postal_code, :format => { :with => /^[AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvXxYy]\d[AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvWwXxYyZz]\s?\d[AaBbCcEeGgHhJjKkLlMmNnPpRrSsTtVvWwXxYyZz]\d$/,
                                       :message => 'Invalid Postal Code' }
  validates :email, :format => { :with => /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/,
                                :message => 'Invalid Email Address' }
end
