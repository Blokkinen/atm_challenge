class Account
  attr_accessor :pin_code, :account_status, :owner

  def initialize(attrs = {})
    set_owner(attrs[:owner])
    @pin_code = generate_pin
    @account_status= :active
  end

  def deactivate
    @account_status= :deactivated
  end

  private

  def set_owner(obj)
  obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "an account owner is required"
  end

  def generate_pin
    rand(1000..9999)
  end

end
