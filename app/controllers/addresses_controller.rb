class AddressesController < ApplicationController


  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to :back, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json

  def destroy
    @address = Address.find(params[:id])
    if @address.present?
      @address.destroy
    end
    redirect_to :back
  end

  def fetch_address
    @contact = Contact.find(params[:id])
    @test = params[:id]

    if Address.where(:contacts_id => params[:id]).blank?
      # no record for this id
      addresses = ''
      respond_to :js
    else
      @addresses = Address.where(:contacts_id => params[:id])
      respond_to :js
    end

  end

  def from_contact
    @selected = Address.where(:contact_id => params[:contact_id])
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :street2, :city, :state, :zip, :phone, :contacts_id)
    end
end
