class ApplicationController < ActionController::Base

  def execute(command)
    handler = "CommandHandlers::#{command.class.name.demodulize}"
    handler.constantize.new.call(command)
  end
end
