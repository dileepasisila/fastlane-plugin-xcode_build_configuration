module Fastlane
  module Actions
    class SetBuildNumberBySchemeAndBuildConfigurationAction < Action
      require 'xcodeproj'
      require 'pathname'

      def self.run(params)
        xcodeProject = Dir["*.xcodeproj"][0]
        project = Xcodeproj::Project.open(xcodeProject)
        configs = project.objects.select { |obj| select_build_configuration_predicate(params[:build_configuration_name], obj) }
        configs.each do |config|
          config.build_settings["CURRENT_PROJECT_VERSION"] = params[:build_number]
        end
        project.save
        UI.success("build number has been updated to #{ params[:build_number]}")
      end

      private_class_method
      def self.select_build_configuration_predicate(name, configuration)
        is_build_valid_configuration = configuration.isa == "XCBuildConfiguration" && !configuration.build_settings["PRODUCT_BUNDLE_IDENTIFIER"].nil?
        is_build_valid_configuration &&= configuration.name == name unless name.nil?
        return is_build_valid_configuration
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Set the build number using scheme and build configuration"
      end

      def self.details
        'Set the $(CURRENT_PROJECT_VERSION) build setting using scheme and  build configuration'
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :build_number,
                                         description: "Change to a specific build number",
                                         optional: false),
            FastlaneCore::ConfigItem.new(key: :scheme,
                                         optional: false,
                                         description: "Specify a specific scheme if you have multiple per project"),
            FastlaneCore::ConfigItem.new(key: :build_configuration_name,
                                         optional: false,
                                         description: "Specify a specific build configuration if you have different build settings for each configuration")
        ]
      end

      def self.authors
        ["Dileepa Sisila Chandrasekara"]
      end

      def self.is_supported?(platform)
        %i[ios mac].include? platform
      end
    end
  end
end
