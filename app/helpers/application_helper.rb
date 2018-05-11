module ApplicationHelper
    def render_if(condition, record)
        if condition 
            render record
        end 
    end
    def devise_mapping
        @devise_mapping ||= request.env["devise.mapping"]
      end
end
