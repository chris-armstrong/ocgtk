(** A layout manager for widgets with a single child.

    Its methods, signals and properties are on {!class-type-bin_layout_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Bin_layout}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BinLayout].}

    Inherits from:
    {{!Ocgtk.Layout_manager.class-type-layout_manager_t}Ocgtk.Layout_manager}

    A layout manager for widgets with a single child.

    [GtkBinLayout] will stack each child of a widget on top of each other, using
    the
    {{!Ocgtk.Widget.class-type-widget_t.method-get_hexpand}[Gtk.Widget:hexpand]},
    {{!Ocgtk.Widget.class-type-widget_t.method-get_vexpand}[Gtk.Widget:vexpand]},
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]},
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties of each child to determine where they should be positioned. *)
class type bin_layout_t = object
  inherit Layout_manager.layout_manager_t

  (** {2:conversions Conversions} *)

  method as_bin_layout : Raw.Bin_layout.t
end

class bin_layout : Raw.Bin_layout.t -> bin_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Bin_layout.t}. *)

(** {1:description Description}

    A layout manager for widgets with a single child.

    [GtkBinLayout] will stack each child of a widget on top of each other, using
    the
    {{!Ocgtk.Widget.class-type-widget_t.method-get_hexpand}[Gtk.Widget:hexpand]},
    {{!Ocgtk.Widget.class-type-widget_t.method-get_vexpand}[Gtk.Widget:vexpand]},
    {{!Ocgtk.Widget.class-type-widget_t.method-get_halign}[Gtk.Widget:halign]},
    and
    {{!Ocgtk.Widget.class-type-widget_t.method-get_valign}[Gtk.Widget:valign]}
    properties of each child to determine where they should be positioned. *)

(** {1:constructors Constructors} *)

val new_ : unit -> bin_layout_t
(** Creates a new [GtkBinLayout] instance. *)
