module ActiveRecordExtensions

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def random(limit=1)
      items = []
      ids = self.select(:id).all
      limit = self.all.count if self.all.count < limit
      while items.size < limit
        item = self.find(ids[rand(ids.size)][:id])
        items << item unless items.include?(item)
      end
      if items.length > 1 then items else items.first end
    end

  end

end

ActiveRecord::Base.send(:include, ActiveRecordExtensions)