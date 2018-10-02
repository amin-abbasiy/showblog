module PostsHelper
    def all
       @posts = Post.all
    end
    def gravatar_for(email, size = 80)
        hashed_id = Digest::MD5.hexdigest(email)
        url = "https://secure.gravatar.com/avatar/#{hashed_id}?s=#{size}"
        image_tag(url, alt: "picture", class: "img rounded-circle") 
    end
end
