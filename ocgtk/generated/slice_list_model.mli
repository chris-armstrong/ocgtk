class type slice_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_offset : unit -> int
  method get_size : unit -> int
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_offset : int -> unit
  method set_size : int -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_slice_list_model : Raw.Slice_list_model.t
end

class slice_list_model : Raw.Slice_list_model.t -> slice_list_model_t

val new_ :
  Ocgio.List_model.list_model_t option -> int -> int -> slice_list_model_t
