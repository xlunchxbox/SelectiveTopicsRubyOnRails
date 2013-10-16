class WorkOrder < ActiveRecord::Base
  validates_presence_of :details, :status
  belongs_to :worker
  
  def self.search(search)
    if search
      where('status LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
