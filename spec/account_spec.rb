require './lib/account.rb'

describe Account do
  let(:person) {double('person', name: 'Viktoria')}
  subject { described_class.new({owner: person}) }

  it 'is expected to have a 4 digit pin number on intitialize' do
   pin_length = Math.log10(subject.pin_code).to_i + 1
   expect(pin_length).to eq 4
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using the instance method' do
    subject.deactivate
    expect(subject.account_status).to eq :deactivated
  end

  it 'is expected to have an owner' do
    expect(subject.owner).to eq person
  end

  it 'is expected to raise an error if no owner is set' do
    expect {described_class.new}.to raise_error 'an account owner is required'
  end

end
