class PresentLikeValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
        like_name = ['service', 'recruit', 'media']
        like_values = like_name.map{|name| record._send_("like_#{name}")}
        unless like_values.include?(true)
            record.errors[attribute] << (options[:message] || 'を選択してください')
        end
    end
end