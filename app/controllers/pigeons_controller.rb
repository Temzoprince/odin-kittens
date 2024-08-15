class PigeonsController < ApplicationController
  def index
    @pigeons = Pigeon.all

    respond_to do |format|
      format.html
      format.json { render :json => @pigeons }
    end
  end

  def show
    @pigeon = Pigeon.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @pigeon }
    end
  end

  def new
    @pigeon = Pigeon.new
  end

  def create
    @pigeon = Pigeon.new(pigeon_params)

    if @pigeon.save
      flash[:notice] = "Pigeon successfully created"
      redirect_to @pigeon
    else
      flash[:notice] = "HAHA, Pigeon creation failed"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pigeon = Pigeon.find(params[:id])
  end

  def update
    @pigeon = Pigeon.find(params[:id])

    if @pigeon.update(pigeon_params)
      flash[:notice] = "Pigeon successfully updated"
      redirect_to @pigeon
    else
      flash[:notice] = "HAHA, Pigeon update failed"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pigeon = Pigeon.find(params[:id])

    @pigeon.destroy
    flash[:notice] = "Pigeon successfully updated"
    redirect_to root_path
  end

  def pigeon_params
    params.require(:pigeon).permit(:name, :age, :cuteness, :softness)
  end
end
