FactoryGirl.define do
  factory :report, class: Report do
    association :service, factory: :service, strategy: :create
    email { Faker::Internet.email }
    detail { Faker:: Lorem.paragraph(2) }
  end

  factory :report_without_detail, class: Report do
    email { Faker::Internet.email }
    service
  end
  factory :report_without_email, class: Report do
    detail { Faker:: Lorem.paragraph(2) }
    service
  end
  factory :report_without_service, class: Report do
    email { Faker::Internet.email }
    detail { Faker:: Lorem.paragraph(2) }
  end
end
