class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.event_id = params[:event_id]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.job_title = params[:job_title]
    @contact.company = params[:company]
    @contact.name = params[:name]

    if @contact.save
      if URI(request.referer).path == '/contacts/new'
        redirect_to "/contacts/#{@contact.id}", :notice => "Contact created successfully."
      else
        redirect_to "/events/#{@contact.event_id}", :notice => "Contact created successfully."
      end
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.event_id = params[:event_id]
    @contact.email = params[:email]
    @contact.phone_number = params[:phone_number]
    @contact.job_title = params[:job_title]
    @contact.company = params[:company]
    @contact.name = params[:name]

    if @contact.save
      redirect_to "/contacts/#{@contact.id}", :notice => "Contact updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    @contact.destroy

    redirect_to "/contacts", :notice => "Contact deleted."
  end
end
