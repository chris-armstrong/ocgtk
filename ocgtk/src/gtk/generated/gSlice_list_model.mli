class type slice_list_model_t = object
  inherit Ocgtk_gio.Gio.List_model.list_model_t
  inherit GSection_model.section_model_t
  method get_model : unit -> Ocgtk_gio.Gio.List_model.list_model_t option
  method get_offset : unit -> int
  method get_size : unit -> int
  method set_model : Ocgtk_gio.Gio.List_model.list_model_t option -> unit
  method set_offset : int -> unit
  method set_size : int -> unit
  method item_type : int
  method n_items : int
  method as_slice_list_model : Slice_list_model.t
end

class slice_list_model : Slice_list_model.t -> slice_list_model_t

val new_ :
  Ocgtk_gio.Gio.List_model.list_model_t option ->
  int ->
  int ->
  slice_list_model_t
