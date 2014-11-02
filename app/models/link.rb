class Link < ActiveRecord::Base
	
  belongs_to :user
  has_many :visits

  validates :slug, :presence => true
  validates :slug, :uniqueness => true
  validates :target_url, :presence => true

  def strip_http!
  	self.target_url.gsub!("http://", "")
  	self.target_url.gsub!("https://", "")
  end

  def visit_count
    visits.count
  end



end
