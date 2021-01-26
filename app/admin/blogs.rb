ActiveAdmin.register_page "blogs" do

  controller do
    def index
      @articles= Article.all
    end
  end

end
