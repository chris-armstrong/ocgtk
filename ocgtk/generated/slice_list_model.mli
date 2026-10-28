(** A list model that presents a slice of another model.

    This is useful when implementing paging by setting the size to the number of
    elements per page and updating the offset whenever a different page is
    opened.

    [GtkSliceListModel] passes through sections from the underlying model.

    Its methods, signals and properties are on {!class-type-slice_list_model_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Slice_list_model}. *)

(** The methods, signals and properties of a [SliceListModel]. *)
class type slice_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model that is currently being used or [NULL] if none. *)

  method get_offset : unit -> int
  (** Gets the offset set via gtk_slice_list_model_set_offset(). *)

  method get_size : unit -> int
  (** Gets the size set via gtk_slice_list_model_set_size(). *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to show a slice of.

      The model's item type must conform to [self]'s item type. *)

  method set_offset : int -> unit
  (** Sets the offset into the original model for this slice.

      If the offset is too large for the sliced model, [self] will end up empty.
  *)

  method set_size : int -> unit
  (** Sets the maximum size. [self] will never have more items than [size].

      It can however have fewer items if the offset is too large or the model
      sliced from doesn't have enough items. *)

  method item_type : Gobject.Type.t
  method n_items : int
  method as_slice_list_model : Raw.Slice_list_model.t
end

class slice_list_model : Raw.Slice_list_model.t -> slice_list_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Slice_list_model.t}. *)

(** {2:constructors Constructors} *)

val new_ :
  Ocgio.List_model.list_model_t option -> int -> int -> slice_list_model_t
(** Creates a new slice model.

    It presents the slice from [offset] to offset + [size] of the given [model].
*)
