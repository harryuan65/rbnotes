require_relative "../base"
require "faker"

class CreateAssembly < ActiveRecord::Migration[7.0]
  def change
    create_table :assemblies, if_not_exists: true do |t|
      t.string :name
    end
    create_table :parts, if_not_exists: true do |t|
      t.string :name
    end
    # If creating another table, why not just has many through? this just adds hidden tables...IDK
    create_table :assemblies_parts, if_not_exists: true, id: false do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end
end

CreateAssembly.new.change

class Assembly < ActiveRecord::Base
  has_and_belongs_to_many :parts
end

class Part < ActiveRecord::Base
  has_and_belongs_to_many :assemblies
end

assembly = Assembly.find_or_create_by!(name: "bike")
part = Part.find_or_create_by!(name: "bike_tire")
assembly.parts << part
assembly.parts.find_or_create_by!(name: "bike_handle")

=begin
assembly.parts
assembly.parts.create
# => Assembly::HABTM_Parts Create (0.6ms)  INSERT INTO "assemblies_parts" ("assembly_id", "part_id") VALUES ($1, $2)  [["assembly_id", 1], ["part_id", 1]]
=end

if __FILE__ == $0
  binding.irb
end