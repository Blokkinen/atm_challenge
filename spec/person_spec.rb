require './lib/person'
require './lib/atm'

describe Person do
  subject { described_class.new(name: 'Viktoria') }


  describe 'can create an account' do
    before { subject.create_account }

    it 'of account class' do
      expect(subject.account).to be_an_instance_of Account
    end

    it 'is excepted to have a :name on initialize' do
      expect(subject.name).not_to be nil
    end

    it 'is expected to raise error if no name is set' do
     expect { described_class.new }.to raise_error 'a name is required'
    end

    it 'is expected to have a :cash attribute with the value of 0 on initialize' do
     expect(subject.cash).to eq 0
    end

    it 'with herself as an owner' do
      expect(subject.account.owner).to be subject
    end

  end

  describe 'can manage funds if an account has been created' do
    let(:atm) { Atm.new }
    before { subject.create_account }

    it 'can deposit funds' do
      expect(subject.deposit(100)).to be_truthy
    end
  end

  describe 'can not manage funds if no account been created' do
    it 'can\'t deposit funds' do
      expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')
    end
  end

    it 'is expected to have an :account attribute' do
      expect(subject.account).to be nil
   end

   it 'funds are added to the account balance - deducted from cash' do
     subject.create_account
     subject.cash = 100
     subject.deposit(100)
     expect(subject.account.balance).to be 100
     expect(subject.cash).to be 0

    end
  end
