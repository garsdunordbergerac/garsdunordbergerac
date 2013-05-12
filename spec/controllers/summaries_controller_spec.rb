require 'spec_helper'

describe SummariesController do
  let(:summaries_controller) do
    summaries_controller = SummariesController.new
    summaries_controller.stub(:params).and_return({ year: '1992' })
    summaries_controller.stub(:render)

    summaries_controller
  end

  it 'responds to json' do
    SummariesController.respond_to.keys.should == [:json]
  end

  describe '#index' do
    it 'calls Summary.for_year with the year parameter' do
      Summary.stub_chain(:for_year, :order)
      Summary.should_receive(:for_year).with(1992)

      summaries_controller.index
    end

    it 'calls #order on summaries to sort them with "happened_at desc"' do
      summaries = mock
      summaries.should_receive(:order).with('happened_at desc')
      Summary.stub(:for_year).and_return(summaries)

      summaries_controller.index
    end

    it 'render a json with sorted summaries' do
      sorted_summaries = mock
      Summary.stub_chain(:for_year, :order).and_return(sorted_summaries)
      summaries_controller.should_receive(:render).with(json: sorted_summaries)

      summaries_controller.index
    end
  end
end
