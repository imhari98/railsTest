class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[ show edit update destroy ]
  before_action :all_contacts, only: %i[ index show new edit create update]
  rescue_from ::Exception, with: :error_occurred

  # GET /contacts or /contacts.json
  def index
    
  end

  # GET /contacts/1 or /contacts/1.json
  def show
    # render json: @contact
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    puts "--- @contact --- #{@contact.inspect}"
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    # contact_static = {"user_id" =>current_user.id, "firstName"=>"cfgvhbjnkm", "lastName"=>"gvhbjnkm", "phoneNumber"=>"2345675677", "email"=>"hariven1998@gmail.com", "address"=>"tnj"}
    # params[:contact][:user_id] = current_user.id
    # result = check_duplicate(contact_params)

    # if result == ''
      @contact = Contact.new(contact_params)
      respond_to do |format|
        if @contact.save
          redirect_to contacts_path
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    # else
    #   flash.now[:notice] = result
    #   respond_to do |format|
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: result, status: :unprocessable_entity }
    #   end
    # end
    
    
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    # result = check_duplicate(contact_params)

    
      
      respond_to do |format|
        begin @contact.update(contact_params)

          
          format.html { redirect_to @contact, notice: "Contact was successfully updated." }
          format.json { render :show, status: :ok, location: @contact }
        rescue => exception
          format.html { redirect_to @contact, alert: exception }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :show, status: :unprocessable_entity }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    
    
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully deleted." }
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

    def error_occurred(exception)
      # render json: {error: exception.message}.to_json, status: 500
      flash.now[:alert] = exception.message
      return 
    end

    # def check_duplicate(contact_object)
    #   result = ''

    #   if defined?(@contact.id) && @contact.id != ''
    #     @contacts.each do |contact|
    #       puts "Contact --- #{contact.phoneNumber}-- #{ contact_object[:phoneNumber]  } -- #{contact.phoneNumber==contact_object[:phoneNumber]} "
    #       if (contact.id != @contact.id) && (contact.phoneNumber == contact_object[:phoneNumber])
    #         puts "Contact --- #{contact.phoneNumber }"
    #         puts "rsult -- #{result}"
    #         return result = "This Phone Number is already exists"
    #       end
    #     end
    #   else
    #     puts "rsult -- #{result}"
    #     return result
        
    #   end
    # end
end
