require File.expand_path('spec_helper', __dir__)

module Danger
  describe DangerKiriban do
    it 'should be a plugin' do
      expect(Danger::DangerKiriban.new(nil)).to be_a Danger::Plugin
    end

    let(:pr_id) { 100 }

    before do
      @dangerfile = testing_dangerfile
      @kiriban = @dangerfile.kiriban
      allow(@kiriban.github).to receive(:pr_json).and_return({'id': pr_id})
    end

    describe '100' do
      let(:pr_id) { 100 }
      it { expect(@kiriban.kiriban?).to eq true }
    end
    describe '111' do
      let(:pr_id) { 111 }
      it { expect(@kiriban.kiriban?).to eq true }
    end
    describe '1' do
      let(:pr_id) { 1 }
      it { expect(@kiriban.kiriban?).to eq false }
    end
    describe '101' do
      let(:pr_id) { 101 }
      it { expect(@kiriban.kiriban?).to eq false }
    end
  end
end
