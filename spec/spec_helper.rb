require 'pathname'

ROOT = Pathname.new(File.expand_path('..', __dir__))
$LOAD_PATH.unshift((ROOT + 'lib').to_s)
$LOAD_PATH.unshift((ROOT + 'spec').to_s)

RSpec.configure do |config|
  config.filter_gems_from_backtrace 'bundler'
  config.color = true
  config.tty = true
end

require 'bundler/setup'
require 'pry'

require 'rspec'
require 'danger'
require 'danger_plugin'

# referred to https://github.com/leonhartX/danger-eslint/blob/master/spec/spec_helper.rb

# rubocop:disable Lint/NestedMethodDefinition
def testing_ui
  @output = StringIO.new
  def @output.winsize
    [20, 9999]
  end

  cork = Cork::Board.new(out: @output)
  def cork.string
    out.string.gsub(/\e\[([;\d]+)?m/, '')
  end
  cork
end
# rubocop:enable Lint/NestedMethodDefinition

# Example environment (ENV) that would come from
# running a PR on TravisCI
def testing_env
  {
    'HAS_JOSH_K_SEAL_OF_APPROVAL' => 'true',
    'TRAVIS_PULL_REQUEST' => '800',
    'TRAVIS_REPO_SLUG' => 'artsy/eigen',
    'TRAVIS_COMMIT_RANGE' => '759adcbd0d8f...13c4dc8bb61d',
    'DANGER_GITHUB_API_TOKEN' => '123sbdq54erfsd3422gdfio'
  }
end

# A stubbed out Dangerfile for use in tests
def testing_dangerfile
  env = Danger::EnvironmentManager.new(testing_env)
  Danger::Dangerfile.new(env, testing_ui)
end
