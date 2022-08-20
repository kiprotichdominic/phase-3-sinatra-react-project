class Todo < ActiveRecord::Base
    VALID_FILTER = %w(all active completed)
    belongs_to :todolist 
    scope :active, -> {where(completed_at: nil)}
    scope :completed, -> {where.not(completed_at: nil)}
end