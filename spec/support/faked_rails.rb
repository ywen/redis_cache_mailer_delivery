module Rails
  class Railtie
    class << self
      def config
        Configuration.new
      end
    end
    
    class Configuration
      def before_configuration
      end
    end
  end
end
