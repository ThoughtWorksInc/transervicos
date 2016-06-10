FactoryGirl.define do
  factory :report, class: Report do
    association :service, factory: :service, strategy: :create
    detail { Faker:: Lorem.paragraph(2) }
  end

  factory :report_without_detail, class: Report do
    service
  end
  factory :report_without_service, class: Report do
    detail { Faker:: Lorem.paragraph(2) }
  end
end
