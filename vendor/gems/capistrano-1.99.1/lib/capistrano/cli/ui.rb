require 'highline'

module Capistrano
  class CLI
    module UI
      def self.included(base) #:nodoc:
        base.extend(ClassMethods)
      end

      module ClassMethods
        # Return the object that provides UI-specific methods, such as prompts
        # and more.
        def ui
          @ui ||= HighLine.new
        end

        # Prompt for a password using echo suppression.
        def password_prompt(prompt="Password: ")
          ui.ask(prompt) { |q| q.echo = false }
        end
      end
    end
  end
end