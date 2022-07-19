# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
  end

  test 'determine if editing is allowed' do
    bob = users(:bob)
    report = reports(:report_one)
    assert report.editable?(@alice)
    assert_not report.editable?(bob)
  end

  test 'change to date class' do
    travel_to Time.zone.local(2022, 7, 1, 12, 0, 0) do
      report = Report.create(user_id: @alice.id, title: '初日報', content: '初日報です')
      assert_equal 'Fri, 01 Jul 2022'.to_date, report.created_on
    end
  end
end
