class ArticlesController < ApplicationController
    # creating new Article 
    def new
        @article = Article.new
    end  

    # creating an Article 
    def create
        @article = Article.new(article_params)
        if  @article.save
            flash[:notice]="A New Article was created!"
            redirect_to article_path(@article)
        else
            render 'new'
        end 
    end 
    # showing the Articles 
    def show
        @article= Article.find(params[:id])
    end 

    private
    def article_params
        params.require(:article).permit(:title, :description)
    end 

end 
