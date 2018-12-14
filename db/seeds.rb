require_relative('../models/merchants')
require_relative('../models/purchases')
require_relative('../models/tags')

Purchase.delete_all
Tag.delete_all
Merchant.delete_all

merchant1 = Merchant.new('name' => 'amazon')
merchant1.save
merchant2 = Merchant.new('name' => 'vodafone')
merchant2.save
merchant3 = Merchant.new('name' => 'lothian bus')
merchant3.save
merchant4 = Merchant.new('name' => 'scotrail')
merchant4.save
merchant5 = Merchant.new('name' => 'asda')
merchant5.save
merchant6 = Merchant.new('name' => 'netflix')
merchant6.save

tag1 = Tag.new('type' => 'entertainment')
tag1.save
tag2 = Tag.new('type' => 'phone')
tag2.save
tag3 = Tag.new('type' => 'travel')
tag3.save
tag4 = Tag.new('type' => 'groceries')
tag4.save

purchase1 = Purchase.new('amount' => 20.97)
purchase1.save
purchase2 = Purchase.new('amount' => 19.87)
purchase2.save
purchase3 = Purchase.new('amount' => 50.00)
purchase3.save
purchase4 = Purchase.new('amount' => 13.45)
purchase4.save
purchase5 = Purchase.new('amount' => 56.34)
purchase5.save
purchase6 = Purchase.new('amount' => 8.00)
purchase6.save
purchase7 = Purchase.new('amount' => 1.23)
purchase7.save
purchase8 = Purchase.new('amount' => 4.35)
purchase8.save
