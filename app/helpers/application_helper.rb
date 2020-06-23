module ApplicationHelper
    def gravatar_for(user, options={size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size= options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end 

    def logged_in?
        !!current_user
        # in rails !! means you are turing a method to boolean
    end 
end
