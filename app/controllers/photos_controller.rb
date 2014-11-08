class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @id = params[:id]
    @caption =  Photo.find_by({ :id => @id }).caption
    @source =  Photo.find_by({ :id => @id }).source

  end

  def new_form

  end

  def edit_form
    @id = params[:id]
    @caption =  Photo.find_by({ :id => @id }).caption
    @source =  Photo.find_by({ :id => @id }).source
  end

  def create_row
    x = Photo.new
    x.caption = params[:the_caption]
    x.source = params[:the_source]
    x.save

    @caption = x.caption
    @source = x.source

  end

  def update_row
    @id = params[:id]
    x = Photo.find_by({ :id => @id })
    x.caption =  params[:the_caption]
    x.source =  params[:the_source]
    x.save

    @caption = x.caption
    @source = x.source
    render("create_row")
  end

  def destroy
    @id = params[:id]
    x =  Photo.find_by({ :id => @id })
    x.destroy
  end
end
