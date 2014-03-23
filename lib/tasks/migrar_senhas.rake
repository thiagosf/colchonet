# encoding: utf-8
namespace :app do
  desc "Encripta todas as senhas \
        que ainda não foram processadas \
        no banco de dados"
  task migrar_senhas: :environment do
    unless User.attribute_names.include? "password"
      puts "As senhas ja foram migradas"
      return
    end

    User.find_each do |user|
      puts "Migrando usuario ##{user.id} #{user.full_name}"
      unecripted_password = user.attributes["password"]

      user.password = unecripted_password
      user.password_confirmation = unecripted_password
      user.save! if user.valid?
    end
  end
end
