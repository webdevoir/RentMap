require 'spec_helper'

describe Offer do
  describe "Parsing" do
    it "should parse offer with correct address" do
      @offer = Offer.parse_from_gumtree("#{Rails.root}/spec/support/offer_with_address.html")

      @offer.latitude.should  == 99.9999
      @offer.longitude.should == 11.1111
      @offer.price.should     == 1100
    end

    it "should call geocoder method correct" do
      Geocoder.should_receive(:coordinates).with(/Al. Street Addr 115, City, Polska/)

      @offer = Offer.parse_from_gumtree("#{Rails.root}/spec/support/offer_with_address.html")
    end

    it "should not parse offer without full address" do
      @offer = Offer.parse_from_gumtree("#{Rails.root}/spec/support/offer_without_address.html")

      @offer.should be_nil
    end
  end
end
