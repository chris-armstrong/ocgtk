(** [GtkColorChooser] is an interface that is implemented by widgets for
    choosing colors.

    Its methods, signals and properties are on {!class-type-color_chooser_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Color_chooser}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorChooser].}

    [GtkColorChooser] is an interface that is implemented by widgets for
    choosing colors.

    Depending on the situation, colors may be allowed to have alpha
    (translucency).

    In GTK, the main widgets that implement this interface are
    [Gtk.ColorChooserWidget], [Gtk.ColorChooserDialog] and [Gtk.ColorButton]. *)
class type color_chooser_t = object
  (** {2:methods Methods} *)

  method add_palette :
    Enums.orientation -> int -> int -> Ocgdk.Raw.Rgb_a.t array option -> unit
  (** Adds a palette to the color chooser.

      If [orientation] is horizontal, the colors are grouped in rows, with
      [colors_per_line] colors in each row. If [horizontal] is [false], the
      colors are grouped in columns instead.

      The default color palette of [Gtk.ColorChooserWidget] has 45 colors,
      organized in columns of 5 colors (this includes some grays).

      The layout of the color chooser widget works best when the palettes have
      9-10 columns.

      Calling this function for the first time has the side effect of removing
      the default color palette from the color chooser.

      If [colors] is [None], removes all previously added palettes. *)

  method get_use_alpha : unit -> bool
  (** Returns whether the color chooser shows the alpha channel. *)

  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  (** Sets the color. *)

  method set_use_alpha : bool -> unit
  (** Sets whether or not the color chooser should use the alpha channel. *)

  (** {2:conversions Conversions} *)

  method as_color_chooser : Raw.Color_chooser.t
end

class color_chooser : Raw.Color_chooser.t -> color_chooser_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_chooser.t}. *)

(** {1:description Description}

    [GtkColorChooser] is an interface that is implemented by widgets for
    choosing colors.

    Depending on the situation, colors may be allowed to have alpha
    (translucency).

    In GTK, the main widgets that implement this interface are
    [Gtk.ColorChooserWidget], [Gtk.ColorChooserDialog] and [Gtk.ColorButton]. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
