FactoryBot.define do
  factory :cliente do
    sequence(:nome) { |n| "Cliente #{n}" }
    sequence(:cpf) { |n| "123.456.789-#{n}" }
    telefone { "(11) 91234-5678" }
    sequence(:email) { |n| "cliente#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
  end
end
