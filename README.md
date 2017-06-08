# README

This is a small demo app to try out devise.

$ rails generate devise:install

Running via Spring preloader in process 86566
      create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views


Routes generated by devise_for :user
======================================

| Prefix                   | Verb   | URI Pattern                    | Controller#Action            |
|:-------------------------|:-------|:-------------------------------|:-----------------------------|
| new_user_session         | GET    | /users/sign_in(.:format)       | devise/sessions#new          |
| user_session             | POST   | /users/sign_in(.:format)       | devise/sessions#create       |
| destroy_user_session     | DELETE | /users/sign_out(.:format)      | devise/sessions#destroy      |
| new_user_password        | GET    | /users/password/new(.:format)  | devise/passwords#new         |
| edit_user_password       | GET    | /users/password/edit(.:format) | devise/passwords#edit        |
| user_password            | PATCH  | /users/password(.:format)      | devise/passwords#update      |
|                          | PUT    | /users/password(.:format)      | devise/passwords#update      |
|                          | POST   | /users/password(.:format)      | devise/passwords#create      |
| cancel_user_registration | GET    | /users/cancel(.:format)        | devise/registrations#cancel  |
| new_user_registration    | GET    | /users/sign_up(.:format)       | devise/registrations#new     |
| edit_user_registration   | GET    | /users/edit(.:format)          | devise/registrations#edit    |
| user_registration        | PATCH  | /users(.:format)               | devise/registrations#update  |
|                          | PUT    | /users(.:format)               | devise/registrations#update  |
|                          | DELETE | /users(.:format)               | devise/registrations#destroy |
|                          | POST   | /users(.:format)               | devise/registrations#create  |

Adding Roles
========================================

This example app adds Roles by an enumeration attribute "role" in the user model.

For ActiveRecord enumerations see: http://www.justinweiss.com/articles/creating-easy-readable-attributes-with-activerecord-enums/
(it is also possible to create roles with a 1..n association in the database).

For an Example how to add an admin role in devise see:
https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-role


This Approach to Roles checks them by an before_action hook in the ApplicationController.

It followes a whitelist approach: all pages are closed except for admins by default;
if controller actions should be accessible to other roles they need to be whitelisted.
See the two controllers in this app for examples.

/roles_demo contains examples how roles can be used in the view. Check the commits in this branch for details.
