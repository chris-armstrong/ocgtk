class type signal_list_item_factory_t = object
  inherit List_item_factory.list_item_factory_t
  method as_signal_list_item_factory : Raw.Signal_list_item_factory.t
end

(* High-level class for SignalListItemFactory *)
class signal_list_item_factory (obj : Raw.Signal_list_item_factory.t) :
  signal_list_item_factory_t =
  object (self)
    inherit List_item_factory.list_item_factory (obj :> Raw.List_item_factory.t)
    method as_signal_list_item_factory = obj
  end

let new_ () : signal_list_item_factory_t =
  new signal_list_item_factory (Raw.Signal_list_item_factory.new_ ())
