class AddDefaultsToSection < ActiveRecord::Migration
  def self.up
    Section.create(:name => "Свадьба", :permalink => "wedding")
    Section.create(:name => "Пейзаж", :permalink => "landscape")
    Section.create(:name => "Дети", :permalink => "children")
    Section.create(:name => "Постановка", :permalink => "staging")
    Section.create(:name => "Интерьер", :permalink => "interior")
  end

  def self.down
  end
end
