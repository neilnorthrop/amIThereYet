class GoalsController < ApplicationController
  before_action :set_user, only: [:create, :update, :edit, :show, :destroy]
  before_action :set_goal, only: [:update, :edit, :show, :destroy]

  def edit
    render partial: 'editgoal'
  end

  def show
  end

  def create
    @goal = @user.goals.create!(goal_params)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'New goal created' }
      format.js
    end
  end

  def update
    store_location
    if @goal.update(goal_params)
      flash[:success] = "Goal Updated"
      redirect_back @user
    else
      flash[:error] = "Goal Not Updated"
      redirect_back @user
    end
  end

  # DELETE /users/1/goals/1
  def destroy
    @goal.destroy
    flash[:success] = "Goal removed."
    respond_to do |format|
        format.html {redirect_to @user}
        format.js
    end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_goal
      @goal = @user.goals.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:description, :motivation)
    end
end
