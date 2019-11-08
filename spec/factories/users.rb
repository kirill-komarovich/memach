# frozen_string_literal: true

RomFactory.define(:user) do |factory|
  factory.username FFaker::Internet.unique.user_name
  factory.telegram_id build(:telegram_user).id
  factory.first_name FFaker::Name.first_name
  factory.last_name FFaker::Name.last_name
  factory.language_code FFaker::Locale.code.downcase
  factory.is_bot false
end
