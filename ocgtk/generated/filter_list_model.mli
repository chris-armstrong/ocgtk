(** A list model that filters the elements of another model.

    It hides some elements from the underlying model according to criteria given
    by a [GtkFilter].

    The model can be set up to do incremental filtering, so that filtering long
    lists doesn't block the UI. See [Gtk.FilterListModel.set_incremental] for
    details.

    [GtkFilterListModel] passes through sections from the underlying model.

    Its methods, signals and properties are on
    {!class-type-filter_list_model_t}. The functions it is built on are in
    {!Ocgtk.Raw.Filter_list_model}. *)

(** The methods, signals and properties of a [GtkFilterListModel]. *)
class type filter_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_filter : unit -> Filter.filter_t option
  method get_incremental : unit -> bool
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_pending : unit -> int
  method get_watch_items : unit -> bool
  method set_filter : Filter.filter_t option -> unit
  method set_incremental : bool -> unit
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method set_watch_items : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_filter_list_model : Raw.Filter_list_model.t
end

class filter_list_model : Raw.Filter_list_model.t -> filter_list_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Filter_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkFilterListModel], give one already wrapped. *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Filter.filter_t option ->
  filter_list_model_t
