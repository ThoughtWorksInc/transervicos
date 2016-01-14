FactoryGirl.define do
  factory :subarea_education_high_school, class: Subarea do
    association :area, factory: :area_education, strategy: :create
    subarea 'High School'
  end

  factory :subarea_education_college, class: Subarea do
    association :area, factory: :area_education, strategy: :create
    subarea 'College'
  end

  factory :subarea_food_others, class: Subarea do
    association :area, factory: :area_food, strategy: :create
    area 'Others'
  end
end
