class TrainingsController < ApplicationController
  before_filter :current_user_or_redirect_to_login
  before_filter :assign_start_at, :assign_end_at, :only => [:create,:update]
  
  # GET /trainings
  # GET /trainings.xml
  def index
    @week = params[:week].try(:to_i) || Date.today.cweek
    @trainings = Training.in_week(@week).order("start_at")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trainings }
    end
  end

  # GET /trainings/1
  # GET /trainings/1.xml
  def show
    @training = Training.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/new
  # GET /trainings/new.xml
  def new
    @training = Training.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @training }
    end
  end

  # GET /trainings/1/edit
  def edit
    @training = Training.find(params[:id])
  end

  # POST /trainings
  # POST /trainings.xml
  def create
    
    @training = Training.new(params[:training])

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
    @training = Training.find(params[:id])

    respond_to do |format|
      if @training.update_attributes(params[:training])
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
    @training = Training.find(params[:id])
    @training.destroy

    respond_to do |format|
      format.html { redirect_to(trainings_url) }
      format.xml  { head :ok }
    end
  end

  private
  def assign_start_at
    params[:training][:start_at] = Time.zone.parse "#{params[:training][:start_date]} #{params[:training][:start_time]}"
    params[:training].delete(:start_date)
    params[:training].delete(:start_time)
  end
  
  def assign_end_at
    params[:training][:end_at] = params[:training][:start_at] + params[:training][:duration].to_i.minutes
    params[:training].delete(:duration)
  end
  
end
