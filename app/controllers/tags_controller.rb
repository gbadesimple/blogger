class TagsController < ApplicationController
    before_filter :require_login, only: [:destroy]
    
    def def show
        @tag = Tag.find(params[:id])
    end

    def index
        @tags = Tag.all
    end
    
    def destroy
        @tag = Tag.new(params[:id])
        @tag.destroy

        flash.notice = "Tag '#{@tag.name}' Deleted!"

        redirect_to tag_path(@tag)

    end
end
