(** A list model that can create child models on demand.

    Its methods, signals and properties are on {!class-type-tree_list_model_t}.
    The functions it is built on are in {!Ocgtk.Raw.Tree_list_model}. *)

(** The methods, signals and properties of a [GtkTreeListModel]. *)
class type tree_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  method get_autoexpand : unit -> bool
  method get_child_row : int -> Tree_list_row.tree_list_row_t option
  method get_model : unit -> Ocgio.List_model.list_model_t
  method get_passthrough : unit -> bool
  method get_row : int -> Tree_list_row.tree_list_row_t option
  method set_autoexpand : bool -> unit
  method item_type : Gobject.Type.t
  method n_items : int
  method as_tree_list_model : Raw.Tree_list_model.t
end

class tree_list_model : Raw.Tree_list_model.t -> tree_list_model_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Tree_list_model.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkTreeListModel], give one already wrapped. *)
