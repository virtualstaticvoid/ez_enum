require 'i18n'
require 'active_support/inflector'

module EZEnum

  class << self

    def included(base)

      const_names = base.constants(false)

      const_names_by_value = const_names.inject({}) do |list, name|
        list[base.const_get(name)] = name
        list
      end

      # add an "All" constant
      base.const_set :All, const_names_by_value.keys

      # add helper methods to module
      base.class_eval do

        # provides an array of display and values pairs
        # typcially for use in HTML select controls
        define_singleton_method :choices_for_select do
          const_names_by_value.collect do |value, name|
            [translate_display_for(name), value]
          end
        end

        # resolves for the display name for the given value
        define_singleton_method :display_for do |value|
          translate_display_for(const_names_by_value[value])
        end

        private

        # lookup i18n translation for given name
        define_singleton_method :translate_display_for do |const_name|
          I18n.translate(
            const_name.to_s.underscore.to_sym,
            :scope => [:enums, base.name.underscore],
            :default => const_name.to_s
          )
        end

      end
    end
  end
end
