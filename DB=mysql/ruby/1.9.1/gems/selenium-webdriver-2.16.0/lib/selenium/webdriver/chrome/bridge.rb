module Selenium
  module WebDriver
    module Chrome

      # @api private
      class Bridge < Remote::Bridge

        def initialize(opts = {})
          http_client = opts.delete(:http_client)
          caps        = create_capabilities(opts)

          @service = Service.default_service
          @service.start

          remote_opts = {
            :url                  => @service.uri,
            :desired_capabilities => caps
          }

          remote_opts.merge!(:http_client => http_client) if http_client

          super(remote_opts)
        end

        def browser
          :chrome
        end

        def driver_extensions
          [
            DriverExtensions::TakesScreenshot,
            DriverExtensions::HasInputDevices
          ]
        end

        def capabilities
          @capabilities ||= Remote::Capabilities.chrome
        end

        def quit
          super
        ensure
          @service.stop
        end

        private

        def create_capabilities(opts)
          args          = opts.delete(:args) || opts.delete(:switches)
          native_events = opts.delete(:native_events)
          verbose       = opts.delete(:verbose)
          profile       = opts.delete(:profile)
          detach        = opts.delete(:detach)

          unless opts.empty?
            raise ArgumentError, "unknown option#{'s' if opts.size != 1}: #{opts.inspect}"
          end

          chrome_options = {}

          if args
            unless args.kind_of? Array
              raise ArgumentError, ":args must be an Array of Strings"
            end

            chrome_options['args'] = args.map { |e| e.to_s }
          end

          if profile
            data = profile.as_json

            chrome_options.merge! 'profile'    => data['zip'],
                                  'extensions' => data['extensions']
          end


          chrome_options['binary']       = Chrome.path if Chrome.path
          chrome_options['nativeEvents'] = true if native_events
          chrome_options['verbose']      = true if verbose
          chrome_options['detach']       = detach.nil? || !!detach

          caps = Remote::Capabilities.chrome
          caps['chromeOptions'] = chrome_options

          # legacy options - for chromedriver < 17.0.963.0
          caps["chrome.switches"] = chrome_options['args'] if chrome_options.member?('args')
          %w[binary detach extensions nativeEvents profile verbose].each do |key|
            caps["chrome.#{key}"] = chrome_options[key] if chrome_options.member?(key)
          end

          caps
        end

      end # Bridge
    end # Chrome
  end # WebDriver
end # Selenium
