require 'rubygems'
require 'puppetlabs_spec_helper/module_spec_helper'

if defined?(RUBY_ENGINE) && RUBY_ENGINE == "ruby" && RUBY_VERSION >= "1.9"
module Kernel
alias :__at_exit :at_exit
def at_exit(&block)
__at_exit do
exit_status = $!.status if $!.is_a?(SystemExit)
block.call
exit exit_status if exit_status
end
end
end
end

