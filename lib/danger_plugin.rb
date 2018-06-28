require "kiriban_getter"

using KiribanGetter

module Danger
  # PullRequest kiriban checker.
  #
  # @example check kiriban
  #
  #          if kiriban.kiriban?
  #            message("this pr number #{kiriban.number} is KIRIBAN!")
  #          end
  #
  # @see  noblejasper/danger-kiriban
  # @tags kiriban
  class DangerKiriban < Plugin

    # Is Pull Request ID kiriban?
    #
    # return [Boolean]
    def kiriban?
      number.kiriban?
    end

    # Get Pull Request ID
    #
    # return [Integer]
    def number
      github.pr_json[:id].to_i
    end

  end
end
