module HumanUrlHelper

  def self.from_param(param)
    find(param.split('-')[0].to_i)
  end

  def to_param
    "#{id}-#{::Russian.translit(title).parameterize}"
  end

end