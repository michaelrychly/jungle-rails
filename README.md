# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server. The app will be served at <http://localhost:3000/>.
10. Go to <http://localhost:3000/> in your browser.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product
!["URL Homepage"](https://github.com/michaelrychly/jungle-rails/blob/master/docs/Sold%20out%20badge.png?raw=true)
!["URL Product"](https://github.com/michaelrychly/jungle-rails/blob/master/docs/Detail%20product%20with%20review.png?raw=true)
!["URL Categories"](https://github.com/michaelrychly/jungle-rails/blob/master/docs/All%20categories.png?raw=true)
!["URL New Category"](https://github.com/michaelrychly/jungle-rails/blob/master/docs/Add%20new%20category.png?raw=true)

## Room for improvement

- implement the following functionality: improve styling of reviews and empty card message, hide add product button when product is sold out, show overall rating of a product
