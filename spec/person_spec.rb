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

  it 'is expected to have an :account attribute' do
    expect(subject.account).to be nil
  end
  
end
