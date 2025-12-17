(* Signal class defined in gsignal_list_item_factory_signals.ml *)

(* High-level class for SignalListItemFactory *)
class signal_list_item_factory (obj : Signal_list_item_factory.t) = object (self)
  inherit Gsignal_list_item_factory_signals.signal_list_item_factory_signals obj

    method as_signal_list_item_factory = obj
end

