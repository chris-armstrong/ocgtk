class type signal_list_item_factory_t = object
  inherit List_item_factory.list_item_factory_t
  method as_signal_list_item_factory : Raw.Signal_list_item_factory.t
end

class signal_list_item_factory :
  Raw.Signal_list_item_factory.t ->
  signal_list_item_factory_t

val new_ : unit -> signal_list_item_factory_t
