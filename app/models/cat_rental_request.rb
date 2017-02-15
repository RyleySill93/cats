class CatRentalRequest < ActiveRecord::Base
  validates :start_date, :end_date, :cat_id, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }

  validate :cat_id, :overlapping_approved_requests

  belongs_to :cat

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save
      deny_overlapping_pending_requests
    end
  end

  def deny!
    self.update_attribute(:status, "DENIED")
  end

  def deny_overlapping_pending_requests
    overlapping_requests("PENDING").each do |request|
      request.deny!
    end
  end

  def overlapping_requests(status)
    requests = CatRentalRequest.where(cat_id: self.cat_id)
    conflicts = requests.select do |request|
      (request.start_date..request.end_date).include?(self.start_date) ||
      (request.start_date..request.end_date).include?(self.end_date)
    end

    conflicts.select do |request|
      request.status == status
    end
  end

  def overlapping_approved_requests
    conflicts = overlapping_requests("APPROVED")

    unless conflicts.empty?
      errors[:cat] << "is already checked out on that date"
    end
  end

end
