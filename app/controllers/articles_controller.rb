class ArticlesController < ApplicationController
    include ArticlesHelper

    #...
    
    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(
            title: params[:article][:title],
            body: params[:article][:body])
        @article.save

        flash.notice = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
        # we can have it like so:
        # def create
        #  @article = Article.new(params[:article])
        #  @article.save
        #  redirect_to article_path(@article)
        # end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        flash.notice = "Article '#{@article.title}' Deleted!"

        redirect_to article_path(@article)
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!"

        redirect_to article_path(@article)
    end
end


