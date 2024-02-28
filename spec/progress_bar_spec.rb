require_relative 'spec_helper'
require_relative '../progress_bar'

RSpec.describe 'ProgressBar' do
  describe '#progress_bar' do
    it 'updates the progress correctly' do
      expect_any_instance_of(TTY::ProgressBar).to receive(:advance).exactly(20).times

      progress_bar
    end
  end
end
