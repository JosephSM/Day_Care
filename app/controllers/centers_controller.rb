class CentersController < ApplicationController
  def index_family
    @center = current_center
  end

  def index_teacher
    @center = current_center
  end

  def index_group
    @teachers = Teacher.all
    @center = current_center
  end

  def rpt_attend
    @children = Child.order("lname")
    @center = current_center
  end

   def rpt_meal
    @children = Child.order("lname")
    @center = current_center
  end

  def index
    @centers = Center.all
    @center = current_center
  end

  def show
    @center = Center.find(params[:id])
     if @center != current_center
      flash[:alert] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def new
    @center = Center.new
    @group = Group.find(params[:id])
  end

  def create
    if @center.save
      session[:center_id] = @center.id
      flash[:alert] = "Welcome!"
      redirect_to centers_path
    else
      flash[:alert] = "There was a problem creating a new center. Please try again."
      render :new
    end
  end

  def Edit
    @center = Center.find(params[:id])
  end

  def update
    @center = Center.find(params[:id])
    @center.update(center_params)
    flash[:alert] = "Center has been updated."
    redirect_to center_path
  end

  def destroy
    Center.find(params[:id]).destroy
    redirect_to (:back)
  end

  private
  def center_params
    params.require(:center).permit(:name, :email, :password, :breakfast, :am_snack, :lunch, :pm_snack, :supper, :late_snack)
  end

end
