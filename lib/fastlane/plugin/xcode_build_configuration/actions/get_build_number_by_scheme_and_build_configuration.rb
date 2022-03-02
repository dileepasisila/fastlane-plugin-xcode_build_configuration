module Fastlane
  module Actions
    class GetBuildNumberBySchemeAndBuildConfigurationAction < Action
      require 'xcodeproj'
      require 'pathname'

      def self.run(params)
        xcodeProject = Dir["*.xcodeproj"][0]
        config = { project: xcodeProject, scheme: params[:scheme], configuration: params[:build_configuration_name] }
        project = FastlaneCore::Project.new(config)
        project.select_scheme
        build_number = project.build_settings(key: 'CURRENT_PROJECT_VERSION')
        UI.user_error! "Cannot resolve $(CURRENT_PROJECT_VERSION) in for the scheme #{config.scheme} with the name #{params.configuration}" if build_number.nil? || build_number.empty?
        return build_number
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Get the build number using scheme and build configuration"
      end

      def self.details
        'Gets the $(CURRENT_PROJECT_VERSION) build setting using scheme and  build configuration'
      end

      def self.available_options
        [   FastlaneCore::ConfigItem.new(key: :scheme,
                                         optional: false,
                                         description: "Specify a specific scheme if you have multiple per project"),
            FastlaneCore::ConfigItem.new(key: :build_configuration_name,
                                         optional: false,
                                         description: "Specify a specific build configuration if you have different build settings for each configuration")
        ]
      end

      def self.output
        [
            ['BUILD_NUMBER', 'The build number']
        ]
      end

      def self.authors
        ["Dileepa Sisila Chandrasekara"]
      end

      def self.return_type
        :string
      end

      def self.is_supported?(platform)
        %i[ios mac].include? platform
      end
    end
  end
end
