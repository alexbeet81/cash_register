# cash_register
## by Alex Pritchard Technical Challenge for Frédéric Cerdan @ Amenitiz
## Usage

Ruby 2.7.3
RSpec 3.12

## Overview

This example Cash Register App allows users to add products to a basket and implement discounts. It provides an interface to display available products, manage a checkout basket, and view the products within the basket.

## Design Decisions

### Data Structures: 

Used arrays to hold collections of products and hashes for storing products with their associated details (like price, name, and code). Hashes provided a convenient way to quickly lookup products by code.

### Classes & Modules:

Product: Represents individual products with properties like code, name, and price.
Basket: Represents the basket into which user selected products are added.
Checkout: Allows scanning of products and managing the basket.
Discount: Represents the rules for a product's discounts.
CheckoutController: Manages the state of the checkout and basket.
DiscountService: Responsible for applying discounts based on predefined criteria.
ProductRepository: Manages the collection of available products and offers methods to fetch them.

### User interface:

Introduced the CheckoutView class to display products in a simple format.

## Testing

Used RSpec for unit testing.
Mocked certain classes like 'ProductRepository' to isolate tests.
Tested key functionalities such as adding products to the basket and applying discounts.

Note: Tests that specifically cover the spec test data can be found by running 'rspec spec/services/discount_service_spec.rb:96'

**Test data**
| Basket | Total price expected |  
|--|--|
| GR1,GR1 |  3.11€ |
| SR1,SR1,GR1,SR1 |  16.61€ |
| GR1,CF1,SR1,CF1,CF1 |  30.57€ |

## Dependencies

Ruby 2.7.3
RSpec 3.12

The app primarily relies on the built-in Ruby library.
RSpec was the main testing library used.

## Possible Improvements

Implement persistence so the basket and product details can be stored and retrieved across sessions.
Expend on the 'DiscountService' to allow for a wider range of discount types.
Implement functionality to allow user to remove items from their baskets.
Implement functionality to allow user too add additional products and discount rules via the interface.
Identify and add additional edge cases to tests.

## Running the App

Before running the app run 'bundle install'
To run the app navigate to the parent directory and type 'ruby main.rb' in your terminal.
To run tests navigate to the parent directory and type 'rspec'
