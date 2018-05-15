ActionMailer::Base.smtp_settings = {
  :port           => ENV['SMTP_PORT'],
  :address        => ENV['SENDGRID_SMTP_SERVER'],
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp