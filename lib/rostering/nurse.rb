class Nurse
  def initialize

  end

  def can_work?
    # Returns True if the conditions allow the nurse to be added to roster when called
  end

  private
  def is_not_working_five_consecutive_days?
    # Returns True if they Nurse is not working 5 consecutive days
  end

  def has_consectutive_weekend?
    # Returns True if the Nurses day's off are 2+ consecutive
  end

  def is_working_five_nights_in_a_month
    # Returns True if the Nurse is working 5 nights in one month
  end

end


# A nurse belongs to a roster
# Can have many shifts
#
