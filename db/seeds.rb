require 'faker'
BRANDS = ["Adidas","Nike","Supreme"]
STORES = ["Kith","Dover Street Market","Shop Nice Kicks", "Supreme New York", "Footlocker", "Finishline"]
CATEGORIES = ["Bots", "Proxies", "Consumables", "Accounts", "Miscellaneous"]


user1 = User.create(
    username: "Test",
    email: "test@email.com",
    password: "123qwe"
)

user2 = User.create(
    username: "2nd User",
    email: "2nd@email.com",
    password: "123qwe"
)

5.times do
    date = Faker::Date.in_date_period
    item = Item.create(
        name: Faker::Commerce.product_name,
        brand: BRANDS[rand(0..BRANDS.size - 1)],
        size: rand(7..12).to_s,
        purchased_from: STORES[rand(0..STORES.size-1)],
        cost: rand(1.0..100.0).round(2),
        purchase_date: date.strftime('%B %d, %Y')
    )
    user1.items << item
end

5.times do
    date = Faker::Date.in_date_period
    item = Item.create(
        name: Faker::Commerce.product_name,
        brand: BRANDS[rand(0..BRANDS.size - 1)],
        size: rand(7..12).to_s,
        purchased_from: STORES[rand(0..STORES.size-1)],
        cost: rand(1.0..100.0).round(2),
        purchase_date: date.strftime('%B %d, %Y')
    )
    user2.items << item
end

5.times do
    date = Faker::Date.in_date_period
    expense = Expense.create(
        name: Faker::Commerce.product_name,
        category: CATEGORIES[rand(0..CATEGORIES.size-1)],
        purchased_from: STORES[rand(0..STORES.size-1)],
        cost: rand(1.0..100.0).round(2),
        purchase_date: date.strftime('%B %d, %Y')
    )
    user1.expenses << expense
end

5.times do
    date = Faker::Date.in_date_period
    expense = Expense.create(
        name: Faker::Commerce.product_name,
        category: CATEGORIES[rand(0..CATEGORIES.size-1)],
        purchased_from: STORES[rand(0..STORES.size-1)],
        cost: rand(1.0..100.0).round(2),
        purchase_date: date.strftime('%B %d, %Y')
    )
    user2.expenses << expense
end