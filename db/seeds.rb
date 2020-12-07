# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Investor.destroy_all
Portfolio.destroy_all
Stock.destroy_all

Investor.create({
    username: "JordanB",
    password: "stock",
    name: "Jordan Belfort",
    bio: "a stockbroker running a Wall Street firm based on scamming people through a pump-and-dump scheme."
})

Investor.create({
    username: "batman",
    password: "batman",
    name: "Bruce W",
    bio: "Batman has dedicated his life to an endless crusade, a war on all criminals in the name of his murdered parents, who were taken from him when he was just a child."
})

# Stock.create({
#     ticker: "TSLA"
# })
# Stock.create({
#     ticker: "AAPL"
# })

i1 = Investor.first
i2 = Investor.second
s1 = Stock.first
s2 = Stock.second

# Portfolio.create({
#     investor_id: i1.id,
#     stock_id: s1.id,
#     price: 100,
#     buysell: true,
#     quantity: 4
# })
# Portfolio.create({
#     investor_id: i2.id,
#     stock_id: s2.id,
#     price: 200,
#     buysell: true,
#     quantity: 5
# })
# Portfolio.create({
#     investor_id: i2.id,
#     stock_id: s2.id,
#     price: 250,
#     buysell: false,
#     quantity: 2
# })


require 'pry'
client = IEX::Api::Client.new(
    publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
    secret_token: 'secret_token',
    endpoint: 'https://sandbox.iexapis.com/v1'
)
# binding.pry
