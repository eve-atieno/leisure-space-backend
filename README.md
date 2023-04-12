# LEISURE SPACE
Leisure Space is a backend repository for a unique platform built using Ruby on Rails and postgresql, and deployed on Render. The platform connects space owners with individuals seeking a location for their next meeting, event or activity. The app features an Admin module with the ability to add spaces and users, and a Client module with the ability to view and book available spaces.

## Getting Started
- Prerequisites

- Ruby 3.0.1

- Rails 6.1.3

- MySQL 5.7

## Installation
- Install dependencies with bundle install

- Create the database with rails db:create

- Migrate the database with rails db:migrate

- Start the server with rails s

## Database Schema
1. User Model:
The User model contains information about users accessing the platform. It has attributes such as name and email, and can have many bookings. It also includes validation rules for the name and email attributes.

2. Space Model:
The Space model contains information about each space available on the platform. It has attributes such as name, description, price, and location, and can have many bookings. It also includes validation rules for the name, description, and price attributes.

3. Booking Model:
The Booking model contains information about each booking made by a user. It has attributes such as start_time and end_time, and belongs to both a user and a space. It also includes validation rules for the start_time and end_time attributes, as well as custom validation methods to ensure that start_time is not in the past and that end_time is after start_time.

## MVP Features
1. Admin Module:
- Add spaces
- View all added spaces (more information about the added space for edits)
- Add Users based on roles and permissions
- View the added users

2. Client Module:

- View available spaces
- View more details about a space
- Login to platform
- Social Auth
- Local Auth
- Book space
- Duration specified
- Amount will be calculated depending on the duration
- Status of the booked space changes i.e it can't be booked till status changes   to available
- Agreement incubator
- Simulate a payment process i.e billing and invoicing of any space booked
Usage
- The API endpoints can be tested using Insomnia, Postman or any other API development tool.

## API Endpoints
1. Create:
POST /users: Creates a new user account. Expects user parameters in the request body.
POST /spaces: Adds a new space to the list of available spaces. Expects space parameters in the request body.
POST /bookings: Creates a new booking for a user. Expects booking parameters in the request body.

2. Read:
GET /users: Retrieves a list of all users.
GET /users/:id: Retrieves details of a specific user with the given ID.
GET /spaces: Retrieves a list of all available spaces.
GET /spaces/:id: Retrieves details of a specific space with the given ID.
GET /bookings: Retrieves a list of all bookings made by the currently authenticated user.
GET /bookings/:id: Retrieves details of a specific booking with the given ID.

3. Update:
PUT /users/:id: Modifies an existing user account with the given ID. Expects user parameters in the request body.
PUT /spaces/:id: Modifies an existing space with the given ID. Expects space parameters in the request body.
PUT /bookings/:id: Modifies an existing booking with the given ID. Expects booking parameters in the request body.

4. Delete:
DELETE /users/:id: Deletes a user account with the given ID.
DELETE /spaces/:id: