ActionMailer::Base.smtp_settings = {
  :port           => '587',
  :address        => 'smpt.sendgrid.net',
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp