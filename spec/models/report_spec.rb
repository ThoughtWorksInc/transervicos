require 'rails_helper'

RSpec.describe Report, type: :model do
  it 'should return detail' do
    detail = 'some_detail'
    report = build(:report, detail: detail)
    expect(report.detail).to be_eql(detail)
  end
  it 'should not create report without detail' do
    report = build(:report_without_detail)
    expect(report).to be_invalid
  end
  it 'should not create report without service' do
    report = build(:report_without_service)
    expect(report).to be_invalid
  end
end
