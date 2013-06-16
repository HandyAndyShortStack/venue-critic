require "cancan/matchers"
require "spec_helper"

describe "User" do
  describe "abilities" do

    subject { ability }
    let ( :ability ) { Ability.new(user) }

    context "unregistered user" do
      let (:user) { user = User.new(role: nil) }
      it { should be_able_to(:read, Venue.new) }
      it { should be_able_to(:read, Review.new) }
      it { should_not be_able_to(:create, Venue) }
      it { should_not be_able_to(:create, Review) }
      it { should_not be_able_to(:destroy, Review) }
      it { should_not be_able_to(:destroy, Venue) }
    end

    context "registered user" do
      let (:user) { Factory(:confirmed_user) }
      let (:users_review) { Factory(:review, user_id: user.id) }
      let (:other_review) { Factory(:review, user_id: (user.id + 1) ) }

      it{ should be_able_to(:manage, users_review ) }
      it{ should be_able_to(:read, other_review) }
      it{ should_not be_able_to(:manage, other_review) }
    end

  end
end

