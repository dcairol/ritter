class MailerController < ApplicationController

  def subscription
    ContactMailer.subscription(params[:email]).deliver
    respond_to do |format|
	format.js{render :close_aside}
    end
  end

  def contact
    ContactMailer.contact(params[:nombre],params[:email],params[:asunto],params[:descripcion]).deliver
    respond_to do |format|
	format.js{render :close_aside}
    end
  end
end
