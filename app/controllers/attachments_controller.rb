class AttachmentsController < ApplicationController

  def new
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.create(params[:attachment])
    
    #delayed_job call - this pushes it to the background
    @attachment.delay.save_page_count

    #however, notice that we could call this same method
    #sync also.
  end

  def show
    a = Attachment.find(params[:id])

    #we call the *same* method sync here. If you use DJ,
    #this, in my opinion, is a downfall because you end
    #up mixing background and foreground code and sprinkle
    #it throughout your codebase, making it more difficult
    #to maintain.
    a.save_page_count

    @page_count = a.page_count
  end
end
