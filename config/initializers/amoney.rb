# config/initializers/money.rb
Money.locale_backend = :i18n

MoneyRails.configure do |config|

  # set the default currency
  config.register_currency = {
    priority: 1,
    iso_code: "BAN",
    name: "Bananas",
    symbol: "🍌",
    disambiguate_symbol: "BAN$",
    alternate_symbols: [],
    subunit: "Peso",
    subunit_to_unit: 1,
    symbol_first: true,
    html_entity: "&#36;",
    decimal_mark: ".",
    thousands_separator: ",",
    smallest_denomination: 1
  }
end
