class type signal_list_item_factory_t = object
  inherit GList_item_factory.list_item_factory_t
  method as_signal_list_item_factory : Signal_list_item_factory.t
end

class signal_list_item_factory :
  Signal_list_item_factory.t ->
  signal_list_item_factory_t

val new_ : unit -> signal_list_item_factory_t
