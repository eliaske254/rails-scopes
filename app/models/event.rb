class Event < ApplicationRecord
  scope :current_month, ->{
    start = Time.zone.now
    where( clocked_in: start.beginning_of_month..start.end_of_month )}

  scope :current_week, ->{
    start = Time.zone.now
    where(clocked_in: start.beginning_of_week..start.end_of_week)}

  scope :payroll_week, ->{
    start = Time.zone.now.beginning_of_week
    ending = start.end_of_week + 7.days
    where(clocked_in: start..ending)
  }
  scope :business_days, ->{
    where("EXTRACT(DOW FROM clocked_in) in (?)", 1..5)
  }


end
