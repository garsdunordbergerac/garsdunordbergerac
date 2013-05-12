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

    it 'formats events descriptions to use HTML characters' do
      events = []
      events << mock(description: 'ma description')
      events << mock(description: 'ma description 2')
      events.each do |event|
        event.stub(:description=)
        events_controller.should_receive(:format_description).with(event.description)
      end
      Event.stub(:for_year).and_return(events)

      events_controller.index
    end

    it 'renders events' do
      events = mock
      Event.stub_chain(:for_year, :each).and_return(events)
      events_controller.should_receive(:render).with(json: events)

      events_controller.index
    end
  end

  describe '#format_description' do
    it 'calls CGI.escapeHTML' do
      CGI.should_receive(:escapeHTML).with('awesome description')
      events_controller.send(:format_description, 'awesome description')
    end

    it 'calls simple_format' do
      CGI.stub(:escapeHTML).and_return('escaped description')
      events_controller.should_receive(:simple_format).with('escaped description')

      events_controller.send(:format_description, 'awesome description')
    end
  end
end
