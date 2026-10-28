(** Base class for filters that combine multiple filters.

    Its methods, signals and properties are on {!class-type-multi_filter_t}. The
    functions it is built on are in {!Ocgtk.Raw.Multi_filter}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MultiFilter].}

    Base class for filters that combine multiple filters. *)
class type multi_filter_t = object
  inherit Filter.filter_t
  inherit Ocgio.List_model.list_model_t
  inherit Buildable.buildable_t

  method append : Filter.filter_t -> unit
  (** Adds a filter. *)

  method remove : int -> unit
  (** Removes a filter.

      If [position] is larger than the number of filters, nothing happens. *)

  method item_type : Gobject.Type.t
  (** The type of items.

      See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items.

      See [Gio.ListModel.get_n_items]. *)

  method as_multi_filter : Raw.Multi_filter.t
end

class multi_filter : Raw.Multi_filter.t -> multi_filter_t
(** Wraps a raw handle of {!Ocgtk.Raw.Multi_filter.t}. *)
