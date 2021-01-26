ActiveAdmin.register Article do
  belongs_to :user	
  permit_params :title, :body, :user_id
  controller do
    def create
      @article = Article.new(permitted_params[:article])
      @article.save
    end
  end
end
