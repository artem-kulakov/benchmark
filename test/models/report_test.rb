require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'report attributes must not be empty' do
    report = Report.new
    assert report.invalid?
    assert report.errors[:company].any?
    assert report.errors[:period].any?
    assert report.errors[:revenues].any?
  end
end
