(* GENERATED CODE - DO NOT EDIT *)
(* Widget: SliceListModel *)

type t = Gtk.widget

(** Create a new SliceListModel *)
external new_ : unit -> int -> int -> t = "ml_gtk_slice_list_model_new"

(* Properties *)

(** Sets the maximum size. @self will never have more items
than @size.

It can however have fewer items if the offset is too large
or the model sliced from doesn't have enough items. *)
external set_size : t -> int -> unit = "ml_gtk_slice_list_model_set_size"

(** Sets the offset into the original model for this slice.

If the offset is too large for the sliced model,
@self will end up empty. *)
external set_offset : t -> int -> unit = "ml_gtk_slice_list_model_set_offset"

(** Gets the size set via gtk_slice_list_model_set_size(). *)
external get_size : t -> int = "ml_gtk_slice_list_model_get_size"

(** Gets the offset set via gtk_slice_list_model_set_offset(). *)
external get_offset : t -> int = "ml_gtk_slice_list_model_get_offset"

