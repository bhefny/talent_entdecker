class ApplicationController < ActionController::Base
  include SendGrid

  layout 'application'

  def send_email_contact(options)
    from = Email.new(email: options[:email])
    to = Email.new(email: 'management@talententdecker.com')
    content = Content.new(type: 'text/plain', value: "name: #{options[:name]}\n email: #{options[:email]}\n phone: #{options[:phone]}\n message: #{options[:message]}")
    send_grid(Mail.new(from, "Contact Form: #{options[:name]}", to, content))

  end

  private

  def send_grid(mail)
    SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY']).client.mail._('send').post(request_body: mail.to_json)
  end

end
