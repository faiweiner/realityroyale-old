require 'spec_helper'

describe Show do
	it { should validate_presence_of(:name) }
end
