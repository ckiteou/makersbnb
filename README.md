# MakersBnB #


#### Headline specifications ####

```
* Any signed-up user can list a new space.
* Users can list multiple spaces.
* Users should be able to name their space, provide a short description of the space, and * a price per night.
* Users should be able to offer a range of dates where their space is available.
* Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
* Nights for which a space has already been booked should not be available for users to book that space.
* Until a user has confirmed a booking request, that space can still be booked for that night.
```

#### User Stories ####

```
User Stories

MVP
------

As a space owner
So I can rent out my space
I want to be able to list it

As a space owner
So I can rent all my spaces
I want to be able to list multiple spaces

As a space owner
So that I can make my listing more attractive
I want to be able to name the space, provide a short description of the space & a price per night

As a guest
So that I can hire a space
I want to be able to make a request to hire a space for one night

Extras 1
------
As a space owner
So I can only host when the space is available
I would like to only be able to offer a range of dates when the space is available

As a guest
So that I can hire a space
I want to be able to make a request to hire a space for a specific night which is available

As a space owner
So I can manage my listing(s)
I want to be able to sign up

As a guest
So that I can use Makersbnb
I would like to sign up for Makersbnb

As a space owner
So I can manage my listing(s)
I want to be able to login and logout

As a guest
So I can manage my booking(s)
I want to be able to login and logout

Extras 2
------

As a space owner
So I do not get double bookings
A night which has already been booked cannot be available to other guests once confirmed by the guest

As a space owner
To avoid undesirable guests
Before a booking is confirmed, I want to approve each request

As a guest
So that I can book a space
I want to be able to confirm the space after the owner has approved my request
```

####Nice-to-haves ####

```
* Users should receive an email whenever one of the following happens:
* They sign up
* They create a space
* They update a space
* A user requests to book their space
* They confirm a request
* They request to book a space
* Their request to book a space is confirmed
* Their request to book a space is denied
* Users should receive a text message to a provided number whenever one of the following happens:
* A user requests to book their space
* Their request to book a space is confirmed
* Their request to book a space is denied
* A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
* Basic payment implementation though Stripe.
