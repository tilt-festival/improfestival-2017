module Jekyll
    module UTCDate
        def to_utc(input)
            Time.parse(input).utc.strftime("%Y%m%dT%H%M%SZ")
        end
    end
end

Liquid::Template.register_filter(Jekyll::UTCDate)
