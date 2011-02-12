class TrainingsController < ApplicationController
  before_filter :current_user_or_redirect_to_login
  before_filter :assign_start_at, :assign_end_at, :only => [:create,:update]
  
  # GET /trainings
  # GET /trainings.xml
  def index
    @week = params[:week].try(:to_i) || Date.today.cweek
    @trainings = Training.in_week(@week)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainings }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.xml
  def new
    @training = current_user.trainings.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = current_user.trainings.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.xml
  def create
    @training = current_user.trainings.new filtered_params

    respond_to do |format|
      if @training.save
        format.html { redirect_to(trainings_path, :notice => 'Training was successfully created.') }
        format.xml  { render :xml => @training, :status => :created, :location => @training }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trainings/1
  # PUT /trainings/1.xml
  def update
    @training = current_user.trainings.find(params[:id])

    respond_to do |format|
      if @training.update_attributes filtered_params
        format.html { redirect_to(trainings_path, :notice => 'Training was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @training.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.xml
  def destroy
    @training = current_user.trainings.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_url) }
      format.xml  { head :ok }
    end
  end

  private
  def filtered_params
    @filtered_params ||= params[:training]
  end

  def assign_start_at(params = filtered_params)
    params[:start_at] = Time.zone.parse "#{params[:start_date]} #{params[:start_time]}"
    params.delete(:start_date)
    params.delete(:start_time)
    @filtered_params = params
  end
  
  def assign_end_at(params = filtered_params)
    params[:end_at] = params[:start_at] + params[:duration].to_i.minutes
    params.delete(:duration)
    @filtered_params = params
  end
  
end
