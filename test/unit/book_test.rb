require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Start by using Shoulda's ActiveRecord matchers

  # TODO: Relationship macros


  # TODO: Validation macros


  # TODO: Test dates as much as you can with matchers...


  context "Creating 5 books and 4 authors" do
    # I can create the objects I want with factories
    setup do
      # Create three categories
      @ruby    = FactoryGirl.create(:category)
      @rails   = FactoryGirl.create(:category, :name => "Rails")
      @testing = FactoryGirl.create(:category, :name => "Testing")

      # Create four authors
      @dblack  = FactoryGirl.create(:author)
      @michael = FactoryGirl.create(:author, :first_name => "Michael", :last_name => "Hartl")
      @aslak   = FactoryGirl.create(:author, :first_name => "Aslak", :last_name => "Hellesoy")
      @dchel   = FactoryGirl.create(:author, :first_name => "David", :last_name => "Chelimsky")

      # Create three published books, one in each category
      @wgr     = FactoryGirl.create(:book, :category => @ruby)
      @r3t     = FactoryGirl.create(:book, :title => "Rails 3 Tutorial", :category => @rails)
      @rspec   = FactoryGirl.create(:book, :title => "The RSpec Book", :category => @testing)

      # Create a book that is under contract, but not yet published, in Ruby category (giving us count=2 for Ruby)
      @rfm     = FactoryGirl.create(:book, :title => "Ruby for Masters", :category => @ruby, :published_date => nil)

      # Create a book that is only proposed, but not under contract, in Testing category (giving us count=2 for Testing)
      @agt     = FactoryGirl.create(:book, :title => "Agile Testing", :category => @testing, :contract_date => nil, :published_date => nil)

      # Connect books to their respective authors
      @ba1     = FactoryGirl.create(:book_author, :book => @wgr, :author => @dblack)
      @ba2     = FactoryGirl.create(:book_author, :book => @r3t, :author => @michael)
      @ba3     = FactoryGirl.create(:book_author, :book => @rfm, :author => @dblack)
      @ba4     = FactoryGirl.create(:book_author, :book => @rspec, :author => @aslak)
      @ba5     = FactoryGirl.create(:book_author, :book => @rspec, :author => @dchel)
      @ba6     = FactoryGirl.create(:book_author, :book => @agt, :author => @dchel)
    end

    # and provide a teardown method as well
    teardown do
      # @ruby.destroy
      # @rails.destroy
      # @testing.destroy
      # @dblack.destroy
      # @michael.destroy
      # @aslak.destroy
      # @dchel.destroy
      # @wgr.destroy
      # @r3t.destroy
      # @rfm.destroy
      # @rspec.destroy
      # @agt.destroy
      # @ba1.destroy
      # @ba2.destroy
      # @ba3.destroy
      # @ba4.destroy
      # @ba5.destroy
      # @ba6.destroy
    end

    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      # assert_equal "Ruby", @ruby.name
      # assert_equal "Rails", @rails.name
      # assert_equal "Testing", @testing.name
      # assert_equal "Black, David", @dblack.name
      # assert_equal "Hartl, Michael", @michael.name
      # assert_equal "Hellesoy, Aslak", @aslak.name
      # assert_equal "Chelimsky, David", @dchel.name
      # assert_equal "The Well-Grounded Rubyist", @wgr.title
      # assert_equal "Rails 3 Tutorial", @r3t.title
      # assert_equal "Ruby for Masters", @rfm.title
      # assert_equal "The RSpec Book", @rspec.title
      # assert_equal "Black, David", @wgr.authors.first.name
      # assert_equal "Hartl, Michael", @r3t.authors.first.name
      # assert_equal 2, @rspec.authors.size
      # assert_equal "Chelimsky, David", @rspec.authors.alphabetical.first.name
      # assert_equal "Black, David", @rfm.authors.first.name
      # assert_nil @agt.contract_date
      # assert_nil @rfm.published_date
    end


    # TESTING SCOPES
    #
    # Avaliable book scopes (copied from book model for easy reference):
    #   - by_title
    #   - by_category
    #   - published
    #   - under_contract
    #   - proposed
    #   - for_category

    should "have all the books listed alphabetically by title" do

    end

    should "have all the books listed alphabetically by category, then by title" do

    end

    should "have all the published books" do

    end

    should "have all the books under contract" do

    end

    should "have all the books that are only at proposal stage" do

    end

    should "have all the books for a particular category" do

    end


    # TESTING CONTRACT AND PUBLISHED DATES
    # proposal_date was validated earlier with a matcher
    #
    # Validations (copied from book model for easy reference):
    #   - validates_date :contract_date, :after => :proposal_date, :on_or_before => lambda { Date.current }, :allow_blank => true
    #   - validates_date :published_date, :after => :contract_date, :on_or_before => lambda { Date.current }, :allow_blank => true

    should "allow for a contract date in the past after the proposal date" do
      # take advantage of the fact that the default proposal date is 1 year ago...

    end

    should "allow for contract and published dates to be nil" do
      # make pub date also nil otherwise it will fail b/c default pub date is 3 weeks ago, which is before a nil contract date

    end

    should "not allow for a contract date in the past before the proposal date" do

    end

    should "not allow for a contract date in the future" do

    end

    should "allow for a published date in the past after the contract date" do
      # take advantage of the fact that the default contract date is 10 months ago...

    end

    should "allow for just the published date to be nil" do

    end

    should "not allow for a published date in the past before the contract date" do

    end

    should "not allow for a published date in the future" do

    end


    # TESTING CUSTOM VALIDATIONS
    #   - test the custom validation 'category_is_active_in_system'
    should "identify an inactive category as invalid" do

    end
  end
end