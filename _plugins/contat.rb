# This is a cherry-pick of https://github.com/Shopify/liquid/pull/540/files
# to add array concat support to Liquid 3.0 (which Jekyll 3.2 uses)
# Once Jekyll upgrades to Liquid 4.0, this can be removed

module Jekyll
    module ArrayConcat
        def a_concat(input, array)
            InputIterator.new(input).concat(array)
        end
    end

    class InputIterator
          include Enumerable

          def initialize(input)
            @input = if input.is_a?(Array)
              input.flatten
            elsif input.is_a?(Hash)
              [input]
            elsif input.is_a?(Enumerable)
              input
            else
              Array(input)
            end
          end

          def join(glue)
            to_a.join(glue)
          end

          def concat(args)
            to_a.concat args
          end

          def reverse
            reverse_each.to_a
          end

          def each
            @input.each do |e|
              yield(e.respond_to?(:to_liquid) ? e.to_liquid : e)
            end
          end
        end
      end

Liquid::Template.register_filter(Jekyll::ArrayConcat)
