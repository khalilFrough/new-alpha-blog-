class ArticlesController < ApplicationController
    def index 
        @article= Article.all 
    end 
    # creating new Article 
    def new
        @article = Article.new
    end  

    # showing the Article created
    def show
        @article= Article.find(params[:id])
    end 
    # editing the Article 
    def edit 
        @article = Article.find(params[:id])
    end 
    # deleting an Article 
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:danger]= "Article was successfuly deleted!"
        redirect_to articles_path
    end 
    def update 
        @article= Article.find(params[:id])
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

end 
