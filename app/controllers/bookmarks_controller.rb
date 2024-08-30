class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = bookmark.new(bookmark_params)
    @bookmark.list = @list
    @list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@bookmark)
    else
      render :bookmark, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path, status: :see_other
  end
end
