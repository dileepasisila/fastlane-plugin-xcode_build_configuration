require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class XcodeBuildConfigurationHelper
      # class methods that you define here become available in your action
      # as `Helper::XcodeBuildConfigurationHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the xcode_build_configuration plugin helper!")
      end
    end
  end
end
