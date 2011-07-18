module PageExtensions

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def in_left_menu
      where(:show_in_left_menu => true).order('lft').with_globalize({})
    end
  end

end

Page.send(:include, PageExtensions)