FactoryGirl.define do
  factory :review do
    user_id 1
    venue_id 1
    overall 5
    note "This place has great ribs!!"
    dispute "We were attacked by the coat check girl."
    soundequip 2
    soundtech 3
    compensation 5
    compdescr "We were paid a $500 guarantee, with 40% of the door on top of that"
  end
end
