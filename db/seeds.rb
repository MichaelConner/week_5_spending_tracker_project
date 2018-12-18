require_relative('../models/merchants')
require_relative('../models/purchases')
require_relative('../models/tags')
require_relative('../models/users')

User.delete_all
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
tag5 = Tag.new('type' => 'utility bills')
tag5.save

purchase1 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 87.97, 'purchase_date' => 20180901)
purchase1.save
purchase2 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 110.03, 'purchase_date' => 20180901)
purchase2.save
purchase3 = Purchase.new('merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => 67.21, 'purchase_date' => 20180901)
purchase3.save
purchase4 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag2.id, 'amount' => 82.79, 'purchase_date' => 20180901)
purchase4.save
purchase5 = Purchase.new('merchant_id' => merchant4.id, 'tag_id' => tag3.id, 'amount' => 800.00, 'purchase_date' => 20180901)
purchase5.save
purchase6 = Purchase.new('merchant_id' => merchant5.id, 'tag_id' => tag4.id, 'amount' => 3600.00, 'purchase_date' => 20180901)
purchase6.save
purchase7 = Purchase.new('merchant_id' => merchant6.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20180901)
purchase7.save
purchase8 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20180901)
purchase8.save

purchase9 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 87.97, 'purchase_date' => 20181001)
purchase9.save
purchase10 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 110.03, 'purchase_date' => 20181001)
purchase10.save
purchase11 = Purchase.new('merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => 67.21, 'purchase_date' => 20181001)
purchase11.save
purchase12 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag2.id, 'amount' => 82.79, 'purchase_date' => 20181001)
purchase12.save
purchase13 = Purchase.new('merchant_id' => merchant4.id, 'tag_id' => tag3.id, 'amount' => 800.00, 'purchase_date' => 20181001)
purchase13.save
purchase14 = Purchase.new('merchant_id' => merchant5.id, 'tag_id' => tag4.id, 'amount' => 3600.00, 'purchase_date' => 20181001)
purchase14.save
purchase15 = Purchase.new('merchant_id' => merchant6.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20181001)
purchase15.save
purchase16 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20181001)
purchase16.save

purchase17 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 87.97, 'purchase_date' => 20181101)
purchase17.save
purchase18 = Purchase.new('merchant_id' => merchant1.id, 'tag_id' => tag1.id, 'amount' => 110.03, 'purchase_date' => 20181101)
purchase18.save
purchase19 = Purchase.new('merchant_id' => merchant2.id, 'tag_id' => tag2.id, 'amount' => 67.21, 'purchase_date' => 20181101)
purchase19.save
purchase20 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag2.id, 'amount' => 82.79, 'purchase_date' => 20181101)
purchase20.save
purchase21 = Purchase.new('merchant_id' => merchant4.id, 'tag_id' => tag3.id, 'amount' => 800.00, 'purchase_date' => 20181101)
purchase21.save
purchase22 = Purchase.new('merchant_id' => merchant5.id, 'tag_id' => tag4.id, 'amount' => 3600.00, 'purchase_date' => 20181101)
purchase22.save
purchase23 = Purchase.new('merchant_id' => merchant6.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20181101)
purchase23.save
purchase24 = Purchase.new('merchant_id' => merchant3.id, 'tag_id' => tag5.id, 'amount' => 150, 'purchase_date' => 20181101)
purchase24.save

user1 = User.new('name' => 'Michael conner', 'budget' => 100.00)
user1.save
user2 = User.new('name' => 'dave Conner', 'budget' => 200.45)
user2.save

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

# user1.delete
# user2.budget = 30.99
# user2.update
# p User.find_by_id(6)

# p merchant1.tags
# p merchant2.tags
# p merchant3.tags

# p tag1.merchants
# p tag2.merchants
# p tag3.merchants

# p purchase1.merchant
# p purchase1.tag

# p Purchase.find_by_year_and_month('2018', '09')
# p Purchase.find_by_year_and_month('2018', '10')

# p Purchase.find_by_merchant('asda')
# p Purchase.find_by_merchant('vodafone')
#
# p Purchase.sum_all_merchant('asda')
# p Purchase.sum_all_merchant('vodafone')
#
# p Purchase.find_by_tag('utility')
# p Purchase.find_by_tag('rent')
#
# p Purchase.sum_all_tag('utility')
# p Purchase.sum_all_tag('rent')

# p Purchase.sum_all

 # p merchant1.name_to_title_case
 # p merchant4.name_to_title_case
 # p merchant6.name_to_title_case
 #
 # p tag4.type_to_title_case
 # p tag5.type_to_title_case
 #
 # p user1.name_to_title_case
 # p user2.name_to_title_case
