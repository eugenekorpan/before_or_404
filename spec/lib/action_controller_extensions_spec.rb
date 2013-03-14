require 'spec_helper'

describe ActionController::Base do
  subject { ActionController::Base }

  it { should respond_to(:before_or_404)}
  it { should respond_to(:prepend_before_or_404)}
  it { should respond_to(:skip_before_or_404)}

end
