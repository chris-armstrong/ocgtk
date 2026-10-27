(** A list model that presents a slice of another model.

    This is useful when implementing paging by setting the size to the number of
    elements per page and updating the offset whenever a different page is
    opened.

    [GtkSliceListModel] passes through sections from the underlying model.

    Its methods, signals and properties are on {!class-type-slice_list_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Slice_list_model}. *)

(** The methods, signals and properties of a [GtkSliceListModel]. *)
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
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Slice_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkSliceListModel], give one already wrapped. *)

val new_ :
  Ocgio.List_model.list_model_t option -> int -> int -> slice_list_model_t
