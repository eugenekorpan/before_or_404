module BeforeOr404
  class FilterWrapper
    def initialize(original_method, klass)
      @original_method = original_method
      @klass         = klass
      @wrapped       = false
      wrap!
    end

    def method
      @name ||= :"before_or_404_#{Time.now.to_i}_#{@original_method}"
    end

    def wrap!
      return @wrapped if @wrapped

      @klass.class_eval %Q{
        def #{method}
          begin
        #{@original_method}
          rescue
            render 'public/404', status: 404
          end
        end
      }
      @wrapped = true
    end
  end
end
