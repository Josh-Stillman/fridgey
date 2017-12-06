class FrozenServing < ApplicationRecord
  belongs_to :recipe
  belongs_to :fridge


  def expiration_date
    self.date_in + 60
  end

  def days_until_expiration
    @days_in_fridge = (Date.today - self.date_in).to_i
    @days_left = (60 - @days_in_fridge).to_i
  end

  def expiration_message
    if self.days_until_expiration == 0
      "Expires today."
    elsif self.days_until_expiration > 0
      "Expires in #{self.days_until_expiration} day(s)."
    else
      @days_since = self.days_until_expiration * -1
      "Expired #{@days_since} day(s) ago."
    end
  end

end
