class FamsController < ApplicationController
  # GET /fams
  # GET /fams.xml
  
  def index
    @fams = Fam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fams }
    end
  end

  # GET /fams/1
  # GET /fams/1.xml
  def show
    @fam = Fam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fam }
    end
  end

  # GET /fams/new
  # GET /fams/new.xml
  def new
    @fam = Fam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fam }
    end
  end

  # GET /fams/1/edit
  def edit
    @fam = Fam.find(params[:id])
  end

  # POST /fams
  # POST /fams.xml
  def create
    @fam = Fam.new(params[:fam])

    respond_to do |format|
      if @fam.save
        flash[:notice] = 'Fam was successfully created.'
        format.html { redirect_to(@fam) }
        format.xml  { render :xml => @fam, :status => :created, :location => @fam }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fams/1
  # PUT /fams/1.xml
  def update
    @fam = Fam.find(params[:id])

    respond_to do |format|
      if @fam.update_attributes(params[:fam])
        flash[:notice] = 'Fam was successfully updated.'
        format.html { redirect_to(@fam) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fams/1
  # DELETE /fams/1.xml
  def destroy
    @fam = Fam.find(params[:id])
    @fam.destroy

    respond_to do |format|
      format.html { redirect_to(fams_url) }
      format.xml  { head :ok }
    end
  end
end
