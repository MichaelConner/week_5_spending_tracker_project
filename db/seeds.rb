require_relative('../models/merchants')
require_relative('../models/purchases')
require_relative('../models/tags')

Purchase.delete_all
Tag.delete_all
Merchant.delete_all

merchant1 = Merchant.new('name' => 'asda')
merchant1.save
merchant2 = Merchant.new('name' => 'vodafone')
merchant2.save
merchant3 = Merchant.new('name' => 'bt')
merchant3.save
merchant4 = Merchant.new('name' => 'bank of scotland')
merchant4.save
merchant5 = Merchant.new('name' => 'lush')
merchant5.save
merchant6 = Merchant.new('name' => 'scottish gas')
merchant6.save

tag1 = Tag.new('type' => 'food')
tag1.save
tag2 = Tag.new('type' => 'data')
tag2.save
tag3 = Tag.new('type' => 'rent')
tag3.save
tag4 = Tag.new('type' => 'candles')
tag4.save
tag5 = Tag.new('type' => 'utility')
tag5.save

purchase1 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 87.97)
purchase1.save
purchase2 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 110.03)
purchase2.save
purchase3 = Purchase.new('merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => 67.21)
purchase3.save
purchase4 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag2.id, 'amount' => 82.79)
purchase4.save
purchase5 = Purchase.new('merchant_id' => merchant4.id, 'tag_id' => tag3.id, 'amount' => 800.00)
purchase5.save
purchase6 = Purchase.new('merchant_id' => merchant5.id, 'tag_id' => tag4.id, 'amount' => 3600.00)
purchase6.save
purchase7 = Purchase.new('merchant_id' => merchant6.id, 'tag_id' => tag5.id, 'amount' => 150)
purchase7.save
purchase8 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag5.id, 'amount' => 150)
purchase8.save

#TESTS

# merchant1.delete
# merchant2.name = 'sky'
# merchant2.update
# p Merchant.find_by_id(179)
#
# tag1.delete
# tag2.type = 'comms'
# tag2.update
# p Tag.find_by_id(53)
#
# purchase1.delete
# purchase2.amount = 30.99
# purchase2.update
# p Purchase.find_by_id(95)

# p merchant1.tags
# p merchant2.tags
# p merchant3.tags

# p tag1.merchants
# p tag2.merchants
# p tag3.merchants
