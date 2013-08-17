require 'spec_helper'

describe EventsController do
  let(:events_controller) do
    events_controller = EventsController.new
    events_controller.stub(:params).and_return(year: '1999')
    events_controller.stub(:render)

    events_controller
  end

  it 'responds to json' do
    EventsController.respond_to.keys.should == [:json]
  end

  describe '#index' do
    it 'calls Event.for_year with year parameter' do
      Event.stub_chain(:for_year, :each)
      Event.should_receive(:for_year).with(1999)

      events_controller.index
    end

    it 'renders events' do
      events = double
      Event.stub_chain(:for_year, :each).and_return(events)
      events_controller.should_receive(:render).with('events/index')

      events_controller.index
    end
  end
end
