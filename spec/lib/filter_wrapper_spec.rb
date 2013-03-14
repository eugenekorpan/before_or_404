require 'spec_helper'

describe BeforeOr404::FilterWrapper do
  let(:acb) { ActionController::Base }

  subject { BeforeOr404::FilterWrapper.new(:find_user, acb) }

  context '#method' do
    it 'should generate name' do
      expect(subject.method).to be
      expect(subject.method).to_not be_blank
    end

    it 'should generate only one name for single instance' do
      expect(subject.method).to eql(subject.method)
    end

    it 'should generate uniq names for different instances' do
      find = BeforeOr404::FilterWrapper.new(:find, acb)
      fetch = BeforeOr404::FilterWrapper.new(:fetch, acb)
      expect(find.method).to_not eql(fetch.method)
    end
  end

  context '#wrap!' do
    it 'should add wrapped method' do
      subject.wrap!
      expect(acb.instance_methods).to include(subject.method)
    end
  end
end
