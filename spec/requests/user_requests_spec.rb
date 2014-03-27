require 'spec_helper'

describe "pagina de login" do 
  it "autenticacao efetuada com sucesso" do 
    data = data_test
    user = User.create!(data)
    user.confirm!

    get new_user_sessions_path

    assert_select "#new_user_session" do 
      assert_select "input[id=?]", "user_session_email"
      assert_select "input[id=?]", "user_session_password"
      assert_select "input[type=?]", "submit"
    end
    
    post_via_redirect user_sessions_path, 
      "user_session[email]" => data[:email], 
      "user_session[password]" => data[:password]

    assert_select "#navbar-top ul li a", :text => "Cadastrar quarto"
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