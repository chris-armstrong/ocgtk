(* GENERATED CODE - DO NOT EDIT *)
(* SliceListModel: SliceListModel *)

(** A list model that presents a slice of another model.

    This is useful when implementing paging by setting the size to the number of
    elements per page and updating the offset whenever a different page is
    opened.

    [GtkSliceListModel] passes through sections from the underlying model.

    The class built on this module is in {!Ocgtk.Slice_list_model}. *)

type t = [ `slice_list_model | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_slice_list_model_get_type"

external new_ : Ocgio_raw.List_model.t option -> int -> int -> t
  = "ml_gtk_slice_list_model_new"
(** Creates a new slice model.

    It presents the slice from [offset] to offset + [size] of the given [model].
*)

(* Methods *)

external set_size : t -> int -> unit = "ml_gtk_slice_list_model_set_size"
(** Sets the maximum size. [self] will never have more items than [size].

    It can however have fewer items if the offset is too large or the model
    sliced from doesn't have enough items. *)

external set_offset : t -> int -> unit = "ml_gtk_slice_list_model_set_offset"
(** Sets the offset into the original model for this slice.

    If the offset is too large for the sliced model, [self] will end up empty.
*)

external set_model : t -> Ocgio_raw.List_model.t option -> unit
  = "ml_gtk_slice_list_model_set_model"
(** Sets the model to show a slice of.

    The model's item type must conform to [self]'s item type. *)

external get_size : t -> int = "ml_gtk_slice_list_model_get_size"
(** Gets the size set via gtk_slice_list_model_set_size(). *)

external get_offset : t -> int = "ml_gtk_slice_list_model_get_offset"
(** Gets the offset set via gtk_slice_list_model_set_offset(). *)

external get_model : t -> Ocgio_raw.List_model.t option
  = "ml_gtk_slice_list_model_get_model"
(** Gets the model that is currently being used or [NULL] if none. *)

(* Properties *)

external get_item_type : t -> Gobject.Type.t
  = "ml_gtk_slice_list_model_get_item_type"
(** The type of items. See [Gio.ListModel.get_item_type]. *)

external get_n_items : t -> int = "ml_gtk_slice_list_model_get_n_items"
(** The number of items. See [Gio.ListModel.get_n_items]. *)
