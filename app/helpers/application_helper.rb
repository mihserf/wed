# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def ident_choice(obj)
     render :partial => "shared/ident_choice", :locals => {:obj => obj, :obj_name => obj.class.to_s.tableize.singularize}
  end
  
  def add_link(name, container)
    link_to_function name do |page|
      page.insert_html :bottom, container.to_sym, :partial => container.singularize, :object => container.classify.constantize.new
      #page << 'initiateDatepicker();' if name=='Добавить дату'
    end
  end
  
end
