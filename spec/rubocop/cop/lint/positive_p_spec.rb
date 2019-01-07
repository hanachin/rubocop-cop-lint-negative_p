RSpec.describe RuboCop::Cop::Lint::PositiveP, :config do
  subject(:cop) { described_class.new(config) }

  context "TargetRubyVersion >= 2.3", :ruby23 do
    it 'allows Numeric#negative?' do
      expect_no_offenses('42.negative?')
    end
  end

  context "TargetRubyVersion < 2.3", :ruby22 do
    it "registers an offense when Numeric#negative? is called" do
      expect_offense(<<-RUBY.strip_indent)
        42.negative?
        ^^^^^^^^^^^^ Do not use Numeric#negative?
      RUBY
    end
  end
end
