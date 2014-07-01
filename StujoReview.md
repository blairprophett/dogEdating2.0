Code Review for blair
================================================
Project: dogEdating2.0
================================================
#URLS

* HEROKU: http://dogedating2.herokuapp.com/
* GITHUB: https://github.com/blairprophett/dogEdating2.0

# Summary

A wonderful app to help dogs date
![Screenshot](screenshot.png)


#Review Rubric

##Implemtation Expecations

* Models & Data Relationships
	* Review: At least 2 related models
* Handles Invalid Data
	* Review: Some on Dogs
* Views & Templates	
	*  One form partial used along with partials in layout, messaging incomplete 
* Authentication
	* Review: Devise, with before_action :authenticate_user!
* Authorization
	* Review: Some missing parts like dog destroy
* API
	*  Expectation: An API call was made.
	* Review: Used yelp gem to get parks in parks controller and geocoder
	* Image upload to aws with carrierwave
* Testing
	*  Expectation: Includes request specs.
	* Review:Blah on the testing 
* Heroku
	*  Expectation: Project is hosted on Heroku
	* Review: Deployed!
* JavaScript/jQuery
	* Expectation: JS/jQuery is used to handle at least one interactive event after the window loads
	* Review:Not used

##Code Quality Expectations

* Test Driven
	* Expectation: In addition to models, requests have been tested for valid 	responses and valid data
	* Review:Not at all
* Flexible / extensible / scalable
	* Expectation: No database calls inside a loop
	* Review:Possible caching of yelp results temporarily 
* Well-commented
	* Expectation: Comments are not sporadic. Comments address the "why".
	* Review: Not so much commenting :( 
* Well-formatted, Clean Project
	* Expectation: No mix of tabs and spaces
	* Review:ok!
* Follows naming conventions
	* Expectation: Naming follows best practices (semantic variable naming)
	* Review:Mailboxer gem still a work in progres
* Secure
	* Expectation: Authorization is implemented as well as authentication.  Athorization is achieved through controller methods or helpers that limit resources
	* Review: Look reasonable but some holes as pointed out
* Documenting Work
	* Expectation: Public presentation of work involving key aspects of development process
	* Review:Pretty good but could be fleshed out
	



#Your Gemfile

```
source 'https://rubygems.org'

# Geocoder for lat long info
gem 'geocoder'
# Mailboxer to make models messageable
gem 'mailboxer'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Devise for authorization
gem 'devise'
# Carrierwave for image upload
gem 'carrierwave'
# Fog for image storage/connection to AWS S3
gem "fog", "~> 1.3.1"
# Yelp gem to access yelp search API
gem 'yelp', require: 'yelp'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
#use Kaminari to simplify pagination of data
gem 'kaminari'

group :development, :test do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Loads environment variables from .env into ENV in development and test
  gem 'dotenv-rails'
  # Rspec testing framework
  gem 'rspec-rails'
  # Automate generation of entity relationship diagram, use rake erd command
  gem 'rails-erd'
  # Use Factory girl for better testing
  gem 'factory_girl_rails'
  # Mute asset pipeline log
  gem 'quiet_assets'
  # Use pry for debugging
  gem 'pry'
  # Use pry-rails for debugging
  gem 'pry-rails'
  # Use pry-debugger for debugging
  gem 'pry-debugger'
end

group :production do
  gem 'rails_12factor'
end

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


```


#Your Schema

```
# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140626010308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "dogs", force: true do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "age"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "dog_id"
    t.integer  "park_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["dog_id"], name: "index_favorites_on_dog_id", using: :btree
  add_index "favorites", ["park_id"], name: "index_favorites_on_park_id", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: true do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  create_table "mailboxer_conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree

  create_table "mailboxer_receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id", using: :btree

  create_table "parks", force: true do |t|
    t.string   "name"
    t.string   "street_address"
    t.text     "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "yelp_id"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", name: "mb_opt_outs_on_conversations_id", column: "conversation_id"

  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", name: "notifications_on_conversation_id", column: "conversation_id"

  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", name: "receipts_on_notification_id", column: "notification_id"

end

```


#Your Schema Diagram


![Model Review](./StujoReviewModels.svg "Your Model Relationships")




#Your Rspec Results

```

```


#Automated Best Practices Review Results

```


Source Codes: |===============================================================================================================================================|
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:47 - always add db index (mailboxer_conversation_opt_outs => [unsubscriber_id, unsubscriber_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:47 - always add db index (mailboxer_conversation_opt_outs => [conversation_id])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:59 - always add db index (mailboxer_notifications => [sender_id, sender_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:59 - always add db index (mailboxer_notifications => [notified_object_id, notified_object_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:79 - always add db index (mailboxer_receipts => [receiver_id, receiver_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:93 - always add db index (notifications => [sender_id, sender_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:93 - always add db index (notifications => [notified_object_id, notified_object_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/schema.rb:128 - always add db index (receipts => [receiver_id, receiver_type])[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/views/conversations/new_msg.html.erb:1 - law of demeter[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/registrations_controller.rb:6 - remove unused methods (RegistrationsController#after_sign_up_path_for)[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/views/dogs/_form.html.erb:1 - replace instance variable with local variable[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/views/dogs/new.html.erb:5 - simplify render in views[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/dogs_controller.rb:18 - use model association (for dog)[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/favorites_controller.rb:19 - use scope access[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/models/park.rb:5 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/models/user.rb:10 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/conversations_controller.rb:14 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/dogs_controller.rb:19 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/favorites_controller.rb:15 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/parks_controller.rb:21 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/controllers/registrations_controller.rb:3 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/config/routes.rb:15 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/db/migrate/20140625192006_create_mailboxer.mailboxer_engine.rb:3 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/assets/stylesheets/application.css.erb:226 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/views/conversations/inbox.html.erb:9 - remove trailing whitespace[0m
[1;31m/work/ga/wdi/2014/march/final_project/blair/app/views/parks/index.html.erb:15 - remove trailing whitespace[0m
[1;32m
Please go to http://rails-bestpractices.com to see more useful Rails Best Practices.[0m
[1;31m
Found 26 warnings.[0m

```


#Automated Code Review Results

```
Inspecting 16 files
.WCCCWC.CCCCC...

Offenses:

app/controllers/conversations_controller.rb:2:1: C: Extra empty line detected at body beginning.
app/controllers/conversations_controller.rb:10:5: W: Useless assignment to variable - dog.
    dog = Dog.find(params[:conversation][:dog])
    ^^^
app/controllers/conversations_controller.rb:14:1: C: Trailing whitespace detected.
app/controllers/conversations_controller.rb:16:7: C: Inconsistent indentation detected.
      flash[:notice] = "Your message has been sent!"
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/conversations_controller.rb:16:24: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      flash[:notice] = "Your message has been sent!"
                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/conversations_controller.rb:17:7: C: Inconsistent indentation detected.
      redirect_to '/messages/inbox'
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/conversations_controller.rb:31:1: C: Trailing whitespace detected.
app/controllers/conversations_controller.rb:32:4: C: Final newline missing.
end
   
app/controllers/dogs_controller.rb:2:1: C: Missing space after #.
#confirms user is signed in
^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/dogs_controller.rb:3:1: C: Use 2 (not 0) spaces for indentation.
before_action :authenticate_user!

app/controllers/dogs_controller.rb:7:3: C: Inconsistent indentation detected.
  def new
  ^^^^^^^
app/controllers/dogs_controller.rb:13:23: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      flash[:alert] = "Sorry! We only allow one dog per account at this time."
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/dogs_controller.rb:18:3: C: Inconsistent indentation detected.
  def create
  ^^^^^^^^^^
app/controllers/dogs_controller.rb:19:29: C: Trailing whitespace detected.
    dog = Dog.new dog_params 
                            ^
app/controllers/dogs_controller.rb:29:3: C: Inconsistent indentation detected.
  def destroy
  ^^^^^^^^^^^
app/controllers/dogs_controller.rb:41:3: C: Inconsistent indentation detected.
  def show
  ^^^^^^^^
app/controllers/dogs_controller.rb:43:1: C: Trailing whitespace detected.
app/controllers/dogs_controller.rb:44:5: C: Use a guard clause instead of wrapping the code inside a conditional expression.
    if @dog.nil?
    ^^
app/controllers/dogs_controller.rb:45:23: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      flash[:alert] = "Oops! That resource is not available."
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/dogs_controller.rb:50:1: C: Extra blank line detected.
app/controllers/dogs_controller.rb:51:3: C: Keep a blank line before and after private.
  private
  ^^^^^^^
app/controllers/dogs_controller.rb:52:5: C: Inconsistent indentation detected.
    def dog_params
    ^^^^^^^^^^^^^^
app/controllers/favorites_controller.rb:5:3: C: Missing space after #.
  #ensure method in model
  ^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/favorites_controller.rb:13:5: C: Inconsistent indentation detected.
    def new_favorite_params
    ^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/favorites_controller.rb:15:8: C: Trailing whitespace detected.
    end 
       ^
app/controllers/favorites_controller.rb:17:5: C: Inconsistent indentation detected.
    def load_dog
    ^^^^^^^^^^^^
app/controllers/favorites_controller.rb:19:7: C: Use fail instead of raise to signal exceptions.
      raise "Oops! You Do Not Have Access To That." unless @dog.user == current_user
      ^^^^^
app/controllers/favorites_controller.rb:19:13: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      raise "Oops! You Do Not Have Access To That." unless @dog.user == current_user
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/favorites_controller.rb:21:1: C: Extra empty line detected at body end.
app/controllers/favorites_controller.rb:22:4: C: Final newline missing.
end
   
app/controllers/parks_controller.rb:4:3: C: Method has too many lines. [15/10]
  def index
  ^^^
app/controllers/parks_controller.rb:6:12: C: Use 2 spaces for indentation in a hash, relative to the start of the line where the left curly brace is.
           limit: 15,
           ^^^^^^^^^
app/controllers/parks_controller.rb:8:11: C: Indent the right brace the same as the start of the line where the left brace is.
          }
          ^
app/controllers/parks_controller.rb:12:22: C: Prefer the use of the nil? predicate.
    if address.first == nil
                     ^^
app/controllers/parks_controller.rb:15:38: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      @latitude = address.first.data["point"]["coordinates"].first
                                     ^^^^^^^
app/controllers/parks_controller.rb:15:47: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      @latitude = address.first.data["point"]["coordinates"].first
                                              ^^^^^^^^^^^^^
app/controllers/parks_controller.rb:16:39: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      @longitude = address.first.data["point"]["coordinates"].last
                                      ^^^^^^^
app/controllers/parks_controller.rb:16:48: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      @longitude = address.first.data["point"]["coordinates"].last
                                               ^^^^^^^^^^^^^
app/controllers/parks_controller.rb:21:1: C: Trailing whitespace detected.
app/controllers/parks_controller.rb:28:3: C: Use 2 (not 3) spaces for indentation.
     @results = Park.near(params[:location])
  ^^^
app/controllers/parks_controller.rb:43:6: C: Trailing whitespace detected.
  end 
     ^
app/controllers/parks_controller.rb:47:1: C: Trailing whitespace detected.
app/controllers/parks_controller.rb:49:23: C: Prefer single-quoted strings when you don't need string interpolation or special symbols.
      flash[:alert] = "Oops! That resource is not available."
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/parks_controller.rb:56:3: C: Keep a blank line before and after private.
  private
  ^^^^^^^
app/controllers/parks_controller.rb:57:5: C: Inconsistent indentation detected.
    def park_params
    ^^^^^^^^^^^^^^^
app/controllers/parks_controller.rb:60:1: C: Extra empty line detected at body end.
app/controllers/registrations_controller.rb:3:1: C: Trailing whitespace detected.
app/controllers/registrations_controller.rb:4:3: C: Missing space after #.
  #controller to override devise default sign-up methods
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/controllers/registrations_controller.rb:6:30: W: Unused method argument - resource. If it's necessary, use _ or _resource as an argument name to indicate that it won't be used. You can also write as after_sign_up_path_for(*) if you want the method to accept any arguments but don't care about them.
  def after_sign_up_path_for(resource)
                             ^^^^^^^^
app/controllers/registrations_controller.rb:9:4: C: Final newline missing.
end
   
app/controllers/sites_controller.rb:2:1: C: Extra empty line detected at body beginning.
app/controllers/sites_controller.rb:11:1: C: Extra empty line detected at body end.
app/controllers/sites_controller.rb:13:1: C: 1 trailing blank lines detected.
app/models/dog.rb:11:3: C: Missing space after #.
  #readys model for CarrierWave image uploader
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/dog.rb:13:1: C: Extra empty line detected at body end.
app/models/dog.rb:14:4: C: Final newline missing.
end
   
app/models/favorite.rb:5:43: C: Use def with parentheses when there are parameters.
  def self.ensure_favorite_from_park_data park_data
                                          ^^^^^^^^^
app/models/favorite.rb:6:5: C: Redundant self detected.
    self.find_or_create_by(park_data)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:2:3: C: Missing space after #.
  #join table on the park and dog models
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:5:1: C: Trailing whitespace detected.
app/models/park.rb:6:3: C: Missing space after #.
  #geocoder gem- automatically fetch coordinates after validation
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:7:3: C: Missing space after #.
  #stored in latitude and longitude attributes
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:11:3: C: Missing space after #.
  #ensures a park is unique before creating a new instance
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:12:34: C: Use def with parentheses when there are parameters.
  def self.ensure_from_yelp_data yelp_data
                                 ^^^^^^^^^
app/models/park.rb:13:5: C: Redundant self detected.
    self.find_or_create_by(yelp_data)
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
app/models/park.rb:15:1: C: Extra empty line detected at body end.
app/models/user.rb:10:1: C: Trailing whitespace detected.
app/models/user.rb:13:3: C: Use 2 (not 1) spaces for indentation.
   return "#{first_name} #{last_name}"
  ^
app/models/user.rb:13:4: C: Redundant return detected.
   return "#{first_name} #{last_name}"
   ^^^^^^
app/uploaders/image_uploader.rb:4:1: C: Extra empty line detected at body beginning.
app/uploaders/image_uploader.rb:10:3: C: Missing space after #.
  #storage :file
  ^^^^^^^^^^^^^^
app/uploaders/image_uploader.rb:50:1: C: Extra empty line detected at body end.

16 files inspected, 72 offenses detected

```

