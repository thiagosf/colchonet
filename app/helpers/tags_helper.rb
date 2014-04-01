# Adicionando metodos em tempo real na Classe TagsHelper
module TagsHelper
	
	# Link de voltar
	def back_link(path)
		link_to get_icon('chevron-left') + t("site.back"), path, :class => 'btn btn-default'
	end

	# Link para adicionar
	def add_link(path)
		link_to get_icon('plus') + t("site.new"), path, :class => 'btn btn-primary', :title => t('site.new')
	end

	# Link para visualizar
	def show_link(path)
		link_to get_icon('search'), path, :class => 'btn btn-info', :title => t('site.show')
	end

	# Link para editar
	def edit_link(method)
		link_to get_icon('edit'), method, :class => 'btn btn-success', :title => t('site.edit')
	end

	# Link para deletar
	def destroy_link(path)
		link_to get_icon('remove'), path, method: :delete, data: { confirm: 'Are you sure?' }, :class => 'btn btn-danger', :title => t('site.destroy')
	end

	# Link para deletar e por ajax e retornar json
	def destroy_link_remote(path)
		link_to get_icon('remove'), path, "data-type" => :json, :remote => true, method: :delete, data: { confirm: 'Are you sure?' }, :class => 'btn btn-danger', :title => t('site.destroy')
	end

	# Breadcrumb
	def breadcrumb
		%{<ol class="breadcrumb">
		  <li>#{link_to t("site.dashboard"), "/"}</li>
		  <li>#{link_to t("site."+controller.controller_name), "/" + controller.controller_path}</li>
		  <li>#{t("site." + controller.action_name)}</li>
		</ol>}.html_safe
	end
	
	# Retorna icone
	def get_icon(name)
		" <i class=\"glyphicon glyphicon-#{name}\" ></i> ".html_safe
	end
end
