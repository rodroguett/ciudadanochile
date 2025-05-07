class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update]

  # GET /citizens
  def index
    @citizens = Citizen.all
  end

  # GET /citizens/1
  def show; end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
  end

  # GET /citizens/1/edit
  def edit; end

  # POST /citizens
  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: 'Citizen was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /citizens/1
  def update
    if @citizen.update(citizen_params)
      redirect_to @citizen, notice: 'Citizen was successfully updated.'
    else
      render :edit
    end
  end

  def search
    @query = params[:q]

    if @query.present?
      if @query =~ /\A\d+\z/ # Verifica si la consulta son solo números (potencial RUT)
        @citizens = Citizen.where("rut LIKE ?", "%#{@query}%")
      else
        @citizens = Citizen.where("name LIKE ?", "%#{@query}%")
      end
    else
      @citizens = [] # O podrías mostrar todos los ciudadanos si la búsqueda está vacía
    end
  end

end