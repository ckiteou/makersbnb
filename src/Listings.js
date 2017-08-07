function Listings(){
  this.all = [];
}

Listings.prototype.add = function (listing) {
  this.all.push(listing);
};
