require 'RMagick'
include Magick

class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])
    @member.picture = Base64.decode64(@member.picture)
    image_thumbnail = Image.from_blob(@member.picture).first
    image_thumbnail.resize_to_fill!(50, 50)
    @member.picture_thumbnail = image_thumbnail.to_blob
    #image_thumbnail.write @member.picture_thumbnail

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])
    member_update = Member.new(params[:member])
    member_update.picture = Base64.decode64(member_update.picture)
    image_thumbnail = Image.from_blob(member_update.picture).first
    image_thumbnail.resize_to_fill!(50, 50)
    member_update.picture_thumbnail = image_thumbnail.to_blob
    update_attributes = {:name => member_update.name,
              :last_name => member_update.last_name,
              :birth_date => member_update.birth_date,
              :contact_phone => member_update.contact_phone,
              :email => member_update.email,
              :address => member_update.address,
              :picture => member_update.picture,
              :picture_thumbnail => member_update.picture_thumbnail
    }
    respond_to do |format|
      if @member.update_attributes(update_attributes)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  def picture
    member = Member.find(params[:id])
    response.headers['Content-Type'] = 'image/png'
    response.headers['Content-Disposition'] = 'inline'
    send_data member.picture, type: 'image/png', disposition: 'inline'
  end

  def thumbnail
    member = Member.find(params[:id])
    response.headers['Content-Type'] = 'image/png'
    response.headers['Content-Disposition'] = 'inline'
    send_data member.picture_thumbnail, type: 'image/png', disposition: 'inline'
  end
end
