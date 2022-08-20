class TodoList < ActiveRecord::Base
    has_many :todos, dependent: :destroy
    VALID_FILTER = %w(all active completed)
    scope :active, -> {where(completed_at: nil)}
    scope :completed, -> {where.not(completed_at: nil)}
end