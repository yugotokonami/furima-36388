FactoryBot.define do
  factory :user do
    nickname                {'test'}
    email                   {'test@example'}
    password                {'123456'}
    encrypted_password      {'123456'}
    first_name              {'太郎'}
    last_name               {'山田'}
    first_name_kana         {'タロウ'}
    last_name_kana          {'ヤマダ'}
    birthday                {'2000-01-01'}
  end
end