module ActionControllerExtensions
  def before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      set_callback :process_action, :before, wrapper_for(name).method, options
    end
  end

  def prepend_before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      set_callback(:process_action, :before, wrapper_for(name).method, options.merge(:prepend => true))
    end
  end

  def skip_before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      skip_callback(:process_action, :before, wrapper_for(name).method, options)
    end
  end

  private

  def wrapper_for(name)
    BeforeOr404::FilterWrapper.new(name, self)
  end
end

ActionController::Base.send :extend, ActionControllerExtensions
