(* GENERATED CODE - DO NOT EDIT *)
(* ColorChooserWidget: ColorChooserWidget *)

(** The [GtkColorChooserWidget] widget lets the user select a color.

    By default, the chooser presents a predefined palette of colors, plus a
    small number of settable custom colors. It is also possible to select a
    different color with the single-color editor.

    To enter the single-color editing mode, use the context menu of any color of
    the palette, or use the '+' button to add a new custom color.

    The chooser automatically remembers the last selection, as well as custom
    colors.

    To create a [GtkColorChooserWidget], use [Gtk.ColorChooserWidget.new].

    To change the initially selected color, use [Gtk.ColorChooser.set_rgba]. To
    get the selected color use [Gtk.ColorChooser.get_rgba].

    The [GtkColorChooserWidget] is used in the
    {{!Ocgtk.Raw.Color_chooser_dialog}[Gtk.ColorChooserDialog]} to provide a
    dialog for selecting colors.

    {b Actions}

    [GtkColorChooserWidget] defines a set of built-in actions:

    - [color.customize] activates the color editor for the given color.
    - [color.select] emits the [Gtk.ColorChooser::color-activated] signal for
      the given color.

    {b CSS names}

    [GtkColorChooserWidget] has a single CSS node with name colorchooser.

    The class built on this module is in {!Ocgtk.Color_chooser_widget}. *)

type t =
  [ `color_chooser_widget | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_color_chooser_widget_get_type"

external new_ : unit -> t = "ml_gtk_color_chooser_widget_new"
(** Creates a new [GtkColorChooserWidget]. *)

(* Methods *)
(* Properties *)

external get_show_editor : t -> bool
  = "ml_gtk_color_chooser_widget_get_show_editor"
(** [true] when the color chooser is showing the single-color editor.

    It can be set to switch the color chooser into single-color editing mode. *)

external set_show_editor : t -> bool -> unit
  = "ml_gtk_color_chooser_widget_set_show_editor"
(** [true] when the color chooser is showing the single-color editor.

    It can be set to switch the color chooser into single-color editing mode. *)
