class WorkoutsController < ApplicationController
  # POST /workouts
  # POST /workouts.xml
  def create
    @workout = Workout.new(params[:workout])

    respond_to do |format|
      if @workout.save
        format.html { redirect_to(trainings_path, :notice => "Workout saved") }
        format.xml  { render :xml => @workout, :status => :created }
      else
        format.html { redirect_to(trainings_path, :alert => "Workout could not be saved") }
        format.xml  { render :xml => @workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.xml
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_path) }
      format.xml  { head :ok }
    end
  end
end
