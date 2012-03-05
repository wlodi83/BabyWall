require 'helper'
require 'foreigner/connection_adapters/mysql2_adapter'

class Foreigner::Mysql2AdapterTest < Foreigner::UnitTest
  include Foreigner::ConnectionAdapters::Mysql2Adapter

  test 'remove_foreign_key_sql by table' do
    assert_equal(
      "DROP FOREIGN KEY `suppliers_company_id_fk`",
      remove_foreign_key_sql(:suppliers, :companies)
    )
  end
  
  test 'remove_foreign_key_sql by name' do
    assert_equal(
      "DROP FOREIGN KEY `belongs_to_supplier`",
      remove_foreign_key_sql(:suppliers, :name => "belongs_to_supplier")
    )
  end
  
  test 'remove_foreign_key_sql by column' do
    assert_equal(
      "DROP FOREIGN KEY `suppliers_ship_to_id_fk`",
      remove_foreign_key_sql(:suppliers, :column => "ship_to_id")
    )
  end
end