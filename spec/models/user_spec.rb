require 'spec_helper'

describe "Usuario" do
  
  it "valido" do
    data = data_test
    user = User.new
    user.full_name = data[:full_name]
    user.email = data[:email]
    user.location = data[:location]
    user.bio = data[:bio]
    user.password = data[:password]
    user.password_confirmation = data[:password_confirmation]
    expect(user.valid?).to be_true
  end

  it "tem um registro" do 
    User.create!( data_test )
    expect(User.where(:email => data_test[:email])).to have(1).record
  end

  it "confirmou cadastro" do
    user = User.create!( data_test )
    user.confirm!
    expect(user.confirmed?).to be_true
  end

  def data_test
    {
      :full_name => "João Buracão",
      :email => "noreply@gmail.com",
      :location => "Jacareí/SP",
      :bio => "Estudante de mecânico de caminhão, aplicado e consultor nas horas vagas",
      :password => "123",
      :password_confirmation => "123"
    }
  end
end
