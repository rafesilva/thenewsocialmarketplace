module ApplicationHelper
    def render_if(condition, record)
        if condition 
            render record
        end 
    end
    def devise_mapping
        @devise_mapping ||= request.env["devise.mapping"]
      end

      def page_header(text)
        content_for(:page_header) { text.to_s }
      end

      def gravatar_for(user, size = 30, title = user.name)
        image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
      end

        def stripe_url
          "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['CLIENT_ID']}&scope=read_write"
        end
      
end
