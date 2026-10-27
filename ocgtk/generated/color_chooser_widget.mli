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

    The [GtkColorChooserWidget] is used in the [Gtk.ColorChooserDialog] to
    provide a dialog for selecting colors.

    {b Actions}

    [GtkColorChooserWidget] defines a set of built-in actions:

    - [color.customize] activates the color editor for the given color.
    - [color.select] emits the [Gtk.ColorChooser::color-activated] signal for
      the given color.

    {b CSS names}

    [GtkColorChooserWidget] has a single CSS node with name colorchooser.

    Its methods, signals and properties are on
    {!class-type-color_chooser_widget_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Color_chooser_widget}. *)

(** The methods, signals and properties of a [ColorChooserWidget]. *)
class type color_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Color_chooser.color_chooser_t

  method show_editor : bool
  (** [TRUE] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method set_show_editor : bool -> unit
  (** [TRUE] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method as_color_chooser_widget : Raw.Color_chooser_widget.t
end

class color_chooser_widget :
  Raw.Color_chooser_widget.t ->
  color_chooser_widget_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_chooser_widget.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> color_chooser_widget_t
(** Creates a new [GtkColorChooserWidget]. *)
