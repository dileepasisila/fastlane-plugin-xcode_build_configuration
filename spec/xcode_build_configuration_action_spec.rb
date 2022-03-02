describe Fastlane::Actions::XcodeBuildConfigurationAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The xcode_build_configuration plugin is working!")

      Fastlane::Actions::XcodeBuildConfigurationAction.run(nil)
    end
  end
end
