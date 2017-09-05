class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    if params[:location] != nil
      location
    elsif params[:company_id] == nil
      all
    else
      find_company
      @contact = @company.contacts.new
      @contacts = @company.contacts
      @jobs = @company.jobs
    end
  end

  def new
    if params[:company_id] == nil
      @check_box = true
    else
      find_company
      @check_box = false
    end
    @job = Job.new
  end

  def create
    set_company
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @comments = @job.comments
    @comment = @job.comments.new
  end

  def edit
    @company = @job.company
  end

  def update
    if @job.update(job_params)
      redirect_to company_jobs_path
    else
      redirect_to edit_company_job_path(@job.company, @job)
    end
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path
  end

  def all
    if params[:sort] == "location"
      @locations = Job.locations
      @jobs = Job.sort_by_location
      render :locations
    elsif params[:sort] == "interest"
      @jobs = Job.order(level_of_interest: :desc)
      render :interest
    end
  end

  def location
    @location = params[:location]
    @jobs = Job.where(city: @location).to_a
    render :location
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end

  def find_company
    @company = Company.find(params[:company_id])
  end

  def set_company
    if params[:company_id] == nil
      @company = Company.find(params[:job][:company_id])
    else
      find_company
    end
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
