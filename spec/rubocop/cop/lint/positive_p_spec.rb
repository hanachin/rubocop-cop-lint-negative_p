RSpec.describe RuboCop::Cop::Lint::PositiveP, :config do
  subject(:cop) { described_class.new(config) }

  context "TargetRubyVersion >= 2.3", :ruby23 do
    it 'allows Numeric#positive?' do
      expect_no_offenses('42.positive?')
    end
  end

  context "TargetRubyVersion < 2.3", :ruby22 do
    it "registers an offense when Numeric#positive? is called" do
      expect_offense(<<-RUBY.strip_indent)
        42.positive?
        ^^^^^^^^^^^^ Do not use Numeric#positive?
      RUBY
    end
  end
end
