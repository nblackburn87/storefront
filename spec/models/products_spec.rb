require 'spec_helper'

describe Products do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
end
