(* GENERATED CODE - DO NOT EDIT *)
(* MultiSelection: MultiSelection *)

(** A selection model that allows selecting multiple elements.

    The class built on this module is in {!Ocgtk.Multi_selection}. *)

type t = [ `multi_selection | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_multi_selection_get_type"

external new_ : Ocgio_raw.List_model.t option -> t
  = "ml_gtk_multi_selection_new"
(** Creates a new selection to handle [model]. *)

(* Methods *)

external set_model : t -> Ocgio_raw.List_model.t option -> unit
  = "ml_gtk_multi_selection_set_model"
(** Sets the model that [self] should wrap.

    If [model] is [NULL], [self] will be empty. *)

external get_model : t -> Ocgio_raw.List_model.t option
  = "ml_gtk_multi_selection_get_model"
(** Returns the underlying model of [self]. *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_multi_selection_get_item_type"
(** The type of items. See [Gio.ListModel.get_item_type]. *)

external get_n_items : t -> int = "ml_gtk_multi_selection_get_n_items"
(** The number of items. See [Gio.ListModel.get_n_items]. *)
