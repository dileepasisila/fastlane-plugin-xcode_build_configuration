module Fastlane
  module Actions
    class GetMarketingVersionBySchemeAndBuildConfigurationAction < Action
      require 'xcodeproj'
      require 'pathname'

      def self.run(params)
        xcodeProject = Dir["*.xcodeproj"][0]
        config = { project: xcodeProject, scheme: params[:scheme], configuration: params[:build_configuration_name] }
        project = FastlaneCore::Project.new(config)
        project.select_scheme
        marketing_version = project.build_settings(key: 'MARKETING_VERSION')
        UI.user_error! "Cannot resolve $(MARKETING_VERSION) in for the scheme #{config.scheme} with the name #{params.configuration}" if marketing_version.nil? || marketing_version.empty?
        return marketing_version
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Get the marketing version using scheme and build configuration"
      end

      def self.details
        'Gets the $(MARKETING_VERSION) build setting using scheme and  build configuration'
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
            ['MARKETING_VERSION', 'The Marketign Version']
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
