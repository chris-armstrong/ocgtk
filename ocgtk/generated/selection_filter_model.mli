(** A list model that presents the selection from a [GtkSelectionModel].

    Its methods, signals and properties are on
    {!class-type-selection_filter_model_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Selection_filter_model}. *)

(** The methods, signals and properties of a [SelectionFilterModel]. *)
class type selection_filter_model_t = object
  inherit Ocgio.List_model.list_model_t

  method get_model : unit -> Selection_model.selection_model_t option
  (** Gets the model currently filtered or [NULL] if none. *)

  method set_model : Selection_model.selection_model_t option -> unit
  (** Sets the model to be filtered.

      Note that GTK makes no effort to ensure that [model] conforms to the item
      type of [self]. It assumes that the caller knows what they are doing and
      have set up an appropriate filter to ensure that item types match. *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  method as_selection_filter_model : Raw.Selection_filter_model.t
end

class selection_filter_model :
  Raw.Selection_filter_model.t ->
  selection_filter_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Selection_filter_model.t}. *)

(** {2:constructors Constructors} *)

val new_ : Selection_model.selection_model_t option -> selection_filter_model_t
(** Creates a new [GtkSelectionFilterModel] that will include the selected items
    from the underlying selection model. *)
