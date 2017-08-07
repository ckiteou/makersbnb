'use strict';

describe('Listings', function(){
  var listings;
  var listing;

  beforeEach(function(){
    listings = new Listings();
  });

  it('adds a listing to the page', function(){
    listings.add("listing")
    expect(listings.all[0]).toEqual("listing");
  });
});
