(** An interface that adds support for sections to list models.

    Its methods, signals and properties are on {!class-type-section_model_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Section_model}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SectionModel].}

    Requires:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}

    An interface that adds support for sections to list models.

    A [GtkSectionModel] groups successive items into so-called sections. List
    widgets like [GtkListView] and [GtkGridView] then allow displaying section
    headers for these sections by installing a header factory.

    Many GTK list models support sections inherently, or they pass through the
    sections of a model they are wrapping.

    When the section groupings of a model change, the model will emit the
    {{!Ocgtk.Section_model.class-type-section_model_t.method-on_sections_changed}
     [Gtk.SectionModel::sections-changed]} signal by calling the
    {{!Ocgtk.Section_model.class-type-section_model_t.method-sections_changed}[Gtk.SectionModel.sections_changed]}
    function. All sections in the given range then need to be queried again. The
    [Gio.ListModel::items-changed] signal has the same effect, all sections in
    that range are invalidated, too. *)
class type section_model_t = object
  (** {2:signals Signals} *)

  method on_sections_changed :
    ?after:bool ->
    callback:(position:int -> n_items:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the start-of-section state of some of the items in [model]
      changes.

      Note that this signal does not specify the new section state of the items,
      they need to be queried manually. It is also not necessary for a model to
      change the section state of any of the items in the section model, though
      it would be rather useless to emit such a signal.

      The [Gio.ListModel::items-changed] implies the effect of the
      [Gtk.SectionModel::sections-changed] signal for all the items it covers.
  *)

  (** {2:methods Methods} *)

  method sections_changed : int -> int -> unit
  (** This function emits the [Gtk.SectionModel::sections-changed] signal to
      notify about changes to sections.

      It must cover all positions that used to be a section start or that are
      now a section start. It does not have to cover all positions for which the
      section has changed.

      The [Gio.ListModel::items-changed] implies the effect of the
      [Gtk.SectionModel::sections-changed] signal for all the items it covers.

      It is recommended that when changes to the items cause section changes in
      a larger range, that the larger range is included in the emission of the
      [Gio.ListModel::items-changed] instead of emitting two signals. *)

  (** {2:conversions Conversions} *)

  method as_section_model : Raw.Section_model.t
end

class section_model : Raw.Section_model.t -> section_model_t
(** Wraps a raw handle of {!Ocgtk.Raw.Section_model.t}. *)

(** {1:description Description}

    An interface that adds support for sections to list models.

    A [GtkSectionModel] groups successive items into so-called sections. List
    widgets like [GtkListView] and [GtkGridView] then allow displaying section
    headers for these sections by installing a header factory.

    Many GTK list models support sections inherently, or they pass through the
    sections of a model they are wrapping.

    When the section groupings of a model change, the model will emit the
    {{!Ocgtk.Section_model.class-type-section_model_t.method-on_sections_changed}
     [Gtk.SectionModel::sections-changed]} signal by calling the
    {{!Ocgtk.Section_model.class-type-section_model_t.method-sections_changed}[Gtk.SectionModel.sections_changed]}
    function. All sections in the given range then need to be queried again. The
    [Gio.ListModel::items-changed] signal has the same effect, all sections in
    that range are invalidated, too. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
