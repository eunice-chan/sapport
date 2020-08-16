class GivesController < ApplicationController
  before_action :set_give, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @give = Give.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @give = Give.new(user_id: current_user.id)
  end

  # GET /tasks/1/edit
  def edit
    @give = Give.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @give = Give.new(give_params)
    @give.user_id = current_user.id

    respond_to do |format|
      if @give.save
        format.html { redirect_to action: :index, notice: 'Give was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @give.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @give.update(give_params)
        format.html { redirect_to action: :index, notice: 'Give was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @give.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @give.destroy
    redirect_to action: :index
  end

  def search
    if params[:search].blank?
      redirect_to browse_path
    else
      @parameter = params[:search].downcase
      @give_results = Give.all.where("lower(title) LIKE :search", search:"%#{@parameter}%").or(Give.all.where("lower(description) LIKE :search", search:"%#{@parameter}%"))
      @user_results = User.all.where("lower(description) LIKE :search", search:"%#{@parameter}%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_give
      @give = Give.find_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def give_params
      params.require(:give).permit([:title, :description, :cost])
    end
end
