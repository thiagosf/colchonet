require 'spec_helper'

describe "Quarto" do

  it "valido" do 
    data = data_test
    room = Room.new
    room.title = data[:title]
    room.location = data[:location]
    room.description = data[:description]
    expect(room.valid?).to be_true
  end

  it "tem um registro" do 
    Room.create!( data_test )
    expect(Room.where(:title => data_test[:title])).to have(1).record
  end

  def data_test 
    {
      :title => "Quarto zona sul",
      :location => "São José dos Campos/SP",
      :description => "Quarto espaçoso, com dois banheiros",
      :user => User.first
    }
  end
end
