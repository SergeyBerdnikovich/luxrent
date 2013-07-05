class Mailer < ActionMailer::Base
  default :from => "luxrent000@gmail.com"

  def send_message(params)
    @params = params
    mail(:to => "luxrent000@gmail.com", :subject => params[:subject])
  end
end