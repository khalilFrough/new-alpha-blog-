class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index 
        @article= Article.paginate(page: params[:page], per_page: 3)
    end 
    # creating new Article 
    def new
        @article = Article.new
    end  

    # showing the Article created
    def show
    end 
    # editing the Article 
    def edit 
        @article = Article.find(params[:id])
    end 
    # deleting an Article 
    def destroy
        @article.destroy
        flash[:danger]= "Article was successfuly deleted!"
        redirect_to articles_path
    end 
    def update 
        if @article.update(article_params)
            flash[:success]= "The Article was successfuly Updated!"
            redirect_to article_path(@article)
        else
            render 'edit'
        end 
    end 

    # creating an Article 
    def create
        @article = Article.new(article_params)
        @article.user= current_user
        if  @article.save
            flash[:success]= "A New Article was created!"
            redirect_to article_path(@article)
        else
            render 'new'
        end 
    end 

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end 

    private
    def set_article
        @article = Article.find(params[:id])
    end 

    def require_same_user
        if current_user != @article.user
            flash[:danger] = "You can only edit or delete your own article"
            redirect_to @article
        end 
    end 

end 
