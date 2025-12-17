class signal_list_item_factory : Signal_list_item_factory.t ->
  object
    inherit Gsignal_list_item_factory_signals.signal_list_item_factory_signals
    method as_signal_list_item_factory : Signal_list_item_factory.t
  end

