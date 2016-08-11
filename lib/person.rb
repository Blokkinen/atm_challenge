require './lib/account'

 class Person
  attr_accessor :account, :name, :cash

  def initialize(attrs={})
    @name = set_name(attrs)
    @cash = 0
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(value)
    if @account == nil
      stop_if_no_account
    else
      @account.balance = @account.balance + value
    end
  end

  def stop_if_no_account
    raise RuntimeError, 'No account present'
  end

  def set_name(attrs)
    if attrs[:name] == nil
      raise 'a name is required'
    else
      attrs[:name]
    end
  end

end
