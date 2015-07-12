require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  fixtures :reports
  
  test 'report attributes must not be empty' do
    report = Report.new
    assert report.invalid?
    assert report.errors[:company].any?
    assert report.errors[:period].any?
    assert report.errors[:revenues].any?
  end
  
  test "revenues must be positive" do
    report = Report.new(company: 'Gazprom', period: 2001)
    
    report.revenues = -1
    assert report.invalid?
    assert_equal ['must be greater than or equal to 0'], report.errors[:revenues]
    
    report.revenues = 0
    assert report.valid?
    
    report.revenues = 1
    assert report.valid?
  end
end
