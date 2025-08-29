FactoryBot.define do
  factory :corretor do
    sequence(:nome) { |n| "Corretor #{n}" }
    sequence(:cpf) { |n| "123.456.789-#{n}" }
    sequence(:creci) { |n| "12345-#{n}" }
    telefone { "(11) 91234-5678" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
