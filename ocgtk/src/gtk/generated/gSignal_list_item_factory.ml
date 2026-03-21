(* Signal class defined in gsignal_list_item_factory_signals.ml *)

class type signal_list_item_factory_t = object
    inherit Gsignal_list_item_factory_signals.signal_list_item_factory_signals
    method as_signal_list_item_factory : Signal_list_item_factory.t
end

(* High-level class for SignalListItemFactory *)
class signal_list_item_factory (obj : Signal_list_item_factory.t) : signal_list_item_factory_t = object (self)
  inherit Gsignal_list_item_factory_signals.signal_list_item_factory_signals obj

    method as_signal_list_item_factory = obj
end

