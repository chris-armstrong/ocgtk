(** A list model that filters the elements of another model.

    Its methods, signals and properties are on
    {!class-type-filter_list_model_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Filter_list_model}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FilterListModel].}

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}
    - {{!Ocgtk.Section_model.class-type-section_model_t}Ocgtk.Section_model}

    A list model that filters the elements of another model.

    It hides some elements from the underlying model according to criteria given
    by a [GtkFilter].

    The model can be set up to do incremental filtering, so that filtering long
    lists doesn't block the UI. See [Gtk.FilterListModel.set_incremental] for
    details.

    [GtkFilterListModel] passes through sections from the underlying model. *)
class type filter_list_model_t = object
  inherit Ocgio.List_model.list_model_t
  inherit Section_model.section_model_t

  (** {2:methods Methods} *)

  method get_filter : unit -> Filter.filter_t option
  (** Gets the [GtkFilter] currently set on [self]. *)

  method get_incremental : unit -> bool
  (** Returns whether incremental filtering is enabled.

      See [Gtk.FilterListModel.set_incremental]. *)

  method get_model : unit -> Ocgio.List_model.list_model_t option
  (** Gets the model currently filtered or [NULL] if none. *)

  method get_pending : unit -> int
  (** Returns the number of items that have not been filtered yet.

      You can use this value to check if [self] is busy filtering by comparing
      the return value to 0 or you can compute the percentage of the filter
      remaining by dividing the return value by the total number of items in the
      underlying model:

      {[
      pending = gtk_filter_list_model_get_pending self;
      model = gtk_filter_list_model_get_model self;
      percentage = pending / double g_list_model_get_n_items model
      ]}

      If no filter operation is ongoing - in particular when
      [Gtk.FilterListModel:incremental] is [FALSE] - this function returns 0. *)

  method get_watch_items : unit -> bool
  (** Returns whether watching items is enabled.

      See [Gtk.FilterListModel.set_watch_items]. *)

  method set_filter : Filter.filter_t option -> unit
  (** Sets the filter used to filter items. *)

  method set_incremental : bool -> unit
  (** Sets the filter model to do an incremental sort.

      When incremental filtering is enabled, the [GtkFilterListModel] will not
      run filters immediately, but will instead queue an idle handler that
      incrementally filters the items and adds them to the list. This of course
      means that items are not instantly added to the list, but only appear
      incrementally.

      When your filter blocks the UI while filtering, you might consider turning
      this on. Depending on your model and filters, this may become interesting
      around 10,000 to 100,000 items.

      By default, incremental filtering is disabled.

      See [Gtk.FilterListModel.get_pending] for progress information about an
      ongoing incremental filtering operation. *)

  method set_model : Ocgio.List_model.list_model_t option -> unit
  (** Sets the model to be filtered.

      Note that GTK makes no effort to ensure that [model] conforms to the item
      type of [self]. It assumes that the caller knows what they are doing and
      have set up an appropriate filter to ensure that item types match. *)

  method set_watch_items : bool -> unit
  (** Sets the filter model to monitor properties of its items.

      This allows implementations of [Gtk.Filter] that support expression
      watching to react to property changes. This property has no effect if the
      current filter doesn't support watching items.

      By default, watching items is disabled. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items. See [Gio.ListModel.get_item_type]. *)

  method n_items : int
  (** The number of items. See [Gio.ListModel.get_n_items]. *)

  (** {2:conversions Conversions} *)

  method as_filter_list_model : Raw.Filter_list_model.t
end

class filter_list_model : Raw.Filter_list_model.t -> filter_list_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Filter_list_model.t}. *)

(** {1:description Description}

    A list model that filters the elements of another model.

    It hides some elements from the underlying model according to criteria given
    by a [GtkFilter].

    The model can be set up to do incremental filtering, so that filtering long
    lists doesn't block the UI. See [Gtk.FilterListModel.set_incremental] for
    details.

    [GtkFilterListModel] passes through sections from the underlying model. *)

(** {1:constructors Constructors} *)

val new_ :
  Ocgio.List_model.list_model_t option ->
  Filter.filter_t option ->
  filter_list_model_t
(** Creates a new [GtkFilterListModel] that will filter [model] using the given
    [filter]. *)
