# Jungle

## Summary

A mini e-commerce application built with Rails 4.2 (Ruby 2.3.5) for using existing code style and approach to implement new features in unfamiliar territory.

## Main Features

- User/Visitor can signup/login/logout
- User/Visitor can see products detail
- User/Visitor can add products into cart and order products
- User recieves order recipt message via email
- Admin can see the number of products/categories/sales
- Admin can add/create new products/categories/sales
- Admin can remove products

### other features implemented

#### UI

- Empty Cart
- Sold Out Badge
- Order Details
- Signup/Login/Logout
- Category (admin)

#### Feature

- User Authentcation
- About Page
- Mailer

#### Fix Bug

- Money Formatting
- Admin Security

#### Admin Feature

- Dashboard
- Categories

#### Test

used RSpec, Capybara, Poltergeist, Phantomjs

- Product/User Model (vaildations)
- Home Page (list products)
- Product Details (link to detail page)
- Add Product into Cart

## Final Product

**Home page**
![home_page](https://github.com/EavanK/Jungle-rails/blob/master/docs/home_page.gif?raw=true)

**Signup and errors**
![signup](https://github.com/EavanK/Jungle-rails/blob/master/docs/signup_and_error.gif?raw=true)

**Login and error**
![login](https://github.com/EavanK/Jungle-rails/blob/master/docs/login_and_error.gif?raw=true)

**Make an order** (+ product detail)
![order](https://github.com/EavanK/Jungle-rails/blob/master/docs/order_products.gif?raw=true)

**Admin**
![admin](https://github.com/EavanK/Jungle-rails/blob/master/docs/admin.gif?raw=true)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example then set up your environment variables
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server (if you are not using vagrant, `bin/rails s`)
9. Go to http://localhost:3000/ in your browser

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Running Test (RSpec + Capybara)

> Generate the binstub so you can run `rspec` instead of `bundle exec rspec` from within the project directory:

```
bundle binstubs rspec-core
```

> Let's create the test pg database. Your development and test databases are separate so that you can run your tests in isolation and neither one affects the other.

```
bin/rake db:setup RAILS_ENV=test
```

> We are now ready to test

```
rspec
```

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL
- Stripe
- bcrypt
- rspec-rails
- capybara

## Future Goal

- (admin)add new sale
- apply a discount
- implement mailer test
- feature - product rating
- feature - inventory adjustment
