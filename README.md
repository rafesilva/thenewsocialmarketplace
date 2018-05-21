# README


    
    The New Social Marketplace.

This project is all about developing a platform which will help all the smallest business getting the next level.
It consists in a two sides marketplace with a main page which holds all the merchants products, streaming it in a very personal way to the customer.

This facility helps you to find new clients redirecting and using their keens to match with your store. This certainly gives an easy way to buyers find your products and in the other way gives you back the data of which sort of client buy from you.
The enviroment provides to you features as comment, rattings, and easy access to the merchant by chat.
    
    Getting Started

These instructions will help you to install and run the NSMP app in local.
You can install the following requirements by Homebrew. 

Homebrew: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
Rails 5.2.0:  gem install rails -v 5.2.0
Ruby: 2.5.2:  brew install ruby or brew install rbenv ruby-build
PostgreSQL: brew install postgresql

You will need an account at AWS S3 to store data files.
You will need an account at Stripe.com to hand the transactions and the merchant side workflow.
You will need an account at SendGrid.com to configurate the ActionMailer.

Cache: ON.
		
    Installing	

Extract the NSMP folder from the zip file to your hardrive.
Access from your Unix terminal by commandline the main folder, ep: 'cd ~/nspm/' .
Run bundle install and wait for the process. 
Create a file '.env' at the root app folder with the followings tags:

STRIPE_PUBLISHABLE_KEY=STRIPE_SECRET_KEY=STRIPE_CONNECT_CLIENT_ID=CONNECTED_STRIPE_ACCOUNT_ID=DEVISE_SECRET_KEY=SENDGRID_SMTP_SERVER=SENDGRID_USERNAME=SENDGRID_PASSWORD=SEND_GRID_KEY=S3_ACCESS_KEY=S3_SECRET_KEY=	S3_REGION=S3_BUCKET=USERNAME_DB=PASSWORD_DB= 

Then run "rails s" on your terminal to start the Rails server.
Go to your brownser and reach the local by http://localhost:3000.


    Version:
Alpha 0.2

    Gems:

gem 'pg'
gem 'stripe'
gem 'omniauth-stripe-connect'
gem 'uglifier', '>= 1.3.0'
gem 'redis', '~> 4.0'
gem 'mini_magick', '~> 4.8'
gem 'carrierwave', '~> 0.10.0'
gem 'devise'
gem 'fog', require: 'fog/aws'
gem 'dotenv-rails'
gem 'cancancan', '~> 2.0'
gem "administrate"
gem 'elasticsearch-model'
gem "mailboxer"
gem 'bootstrap-will_paginate'
gem 'will_paginate'
gem 'gravatar_image_tag'
gem 'chosen-rails'
gem 'gon'

    
    Authors:

Rafael Ferreira da Silva -Coder Academy Student


    License
See the LICENSE.md file for details
