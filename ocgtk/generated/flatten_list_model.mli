(** A list model that concatenates other list models.

    [GtkFlattenListModel] takes a list model containing list models, and
    flattens it into a single model. Each list model becomes a section in the
    single model.

    Its methods, signals and properties are on
    {!class-type-flatten_list_model_t}. The functions it is built on are in
    {!Ocgtk.Raw.Flatten_list_model}. *)

(** The methods, signals and properties of a [GtkFlattenListModel]. *)
class type flatten_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t
  method get_model : unit -> Ocgio.List_model.list_model_t option
  method get_model_for_item : int -> Ocgio.List_model.list_model_t option
  method set_model : Ocgio.List_model.list_model_t option -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_flatten_list_model : Raw.Flatten_list_model.t
end

class flatten_list_model : Raw.Flatten_list_model.t -> flatten_list_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Flatten_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkFlattenListModel], give one already wrapped. *)

val new_ : Ocgio.List_model.list_model_t option -> flatten_list_model_t
