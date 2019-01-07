RSpec.describe RuboCop::Cop::Lint::PositiveP do
  subject(:cop) { described_class.new }

  it "registers an offense when #positive? is called" do
    expect_offense(<<-RUBY.strip_indent)
      42.positive?
      ^^^^^^^^^^^^ Do not use Numeric#positive?
    RUBY
  end
end
