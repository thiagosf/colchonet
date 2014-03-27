require 'spec_helper'

describe RoomsController do
  describe "GET #index" do 
    it "respondeu com sucesso o acesso" do 
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renderizou o template index" do 
      get :index
      expect(response).to render_template("index")
    end
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
