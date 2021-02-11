class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all.where(:user_id => current_user.id).sort_by {|sort| sort.firstName}
    # render 'test'
  end

  # GET /contacts/1 or /contacts/1.json
  def show
    # render json: @contact
    all_contacts
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    all_contacts
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    # contact_static = {"user_id" =>current_user.id, "firstName"=>"cfgvhbjnkm", "lastName"=>"gvhbjnkm", "phoneNumber"=>"2345675677", "email"=>"hariven1998@gmail.com", "address"=>"tnj"}
    # params[:contact][:user_id] = current_user.id
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        puts "@contact.errors -- #{@contact.errors.inspect}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def all_contacts
      @contacts = Contact.all.where(:user_id => current_user.id).sort_by {|sort| sort.firstName}
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      # params.fetch(:contact, {})
      params.require(:contact).permit(:firstName, :lastName, :phoneNumber, :email, :address, :user_id)
    end
end
