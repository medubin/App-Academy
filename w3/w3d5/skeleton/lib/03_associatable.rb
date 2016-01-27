require_relative '02_searchable'
require 'active_support/inflector'
require 'byebug'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    if self.is_a?(BelongsToOptions)
      foreign_key.to_s[0..-4].classify.constantize.table_name
    elsif self.is_a?(HasManyOptions)
      class_name.constantize.table_name
    end
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = options[:foreign_key] || (name.to_s.underscore + '_id').to_sym
    @primary_key = options[:primary_key] || :id
    @class_name =  options[:class_name]  || name.to_s.singularize.camelcase
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = options[:foreign_key] || (self_class_name.underscore + '_id').to_sym
    @primary_key = options[:primary_key] || :id
    @class_name =  options[:class_name]  || name.singularize.camelcase

  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    opts = BelongsToOptions.new(name, options)

    define_method(opts.class_name.downcase.underscore) do
      opts.model_class.where(opts.primary_key => self.send(opts.foreign_key)).first
    end

  end

  def has_many(name, options = {})
    opts = BelongsToOptions.new(name, options)
    define_method(opts.class_name.downcase.underscore.pluralize) do
      opts.model_class.where(opts.primary_key => opts.model_class.new.send((opts.foreign_key)))
    end
    # self.send(opts.class_name.downcase.underscore.pluralize)
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  # Mixin Associatable here...
end