(** The [GtkColorChooserWidget] widget lets the user select a color.

    Its methods, signals and properties are on
    {!class-type-color_chooser_widget_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Color_chooser_widget}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorChooserWidget].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Color_chooser.class-type-color_chooser_t}Ocgtk.Color_chooser}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}

    The [GtkColorChooserWidget] widget lets the user select a color.

    By default, the chooser presents a predefined palette of colors, plus a
    small number of settable custom colors. It is also possible to select a
    different color with the single-color editor.

    To enter the single-color editing mode, use the context menu of any color of
    the palette, or use the '+' button to add a new custom color.

    The chooser automatically remembers the last selection, as well as custom
    colors.

    To create a [GtkColorChooserWidget], use
    {{!Ocgtk.Color_chooser_widget.val-new_}[Gtk.ColorChooserWidget.new]}.

    To change the initially selected color, use
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t.method-set_rgba}[Gtk.ColorChooser.set_rgba]}.
    To get the selected color use [Gtk.ColorChooser.get_rgba].

    The [GtkColorChooserWidget] is used in the
    {{!Ocgtk.Color_chooser_dialog.class-type-color_chooser_dialog_t}[Gtk.ColorChooserDialog]}
    to provide a dialog for selecting colors.

    {b Actions}

    [GtkColorChooserWidget] defines a set of built-in actions:

    - [color.customize] activates the color editor for the given color.
    - [color.select] emits the [Gtk.ColorChooser::color-activated] signal for
      the given color.

    {b CSS names}

    [GtkColorChooserWidget] has a single CSS node with name colorchooser. *)
class type color_chooser_widget_t = object
  inherit Widget.widget_t
  inherit Color_chooser.color_chooser_t

  (** {2:properties Properties} *)

  method show_editor : bool
  (** [true] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method set_show_editor : bool -> unit
  (** [true] when the color chooser is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  (** {2:conversions Conversions} *)

  method as_color_chooser_widget : Raw.Color_chooser_widget.t
end

class color_chooser_widget :
  Raw.Color_chooser_widget.t ->
  color_chooser_widget_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_chooser_widget.t}. *)

(** {1:description Description}

    The [GtkColorChooserWidget] widget lets the user select a color.

    By default, the chooser presents a predefined palette of colors, plus a
    small number of settable custom colors. It is also possible to select a
    different color with the single-color editor.

    To enter the single-color editing mode, use the context menu of any color of
    the palette, or use the '+' button to add a new custom color.

    The chooser automatically remembers the last selection, as well as custom
    colors.

    To create a [GtkColorChooserWidget], use
    {{!Ocgtk.Color_chooser_widget.val-new_}[Gtk.ColorChooserWidget.new]}.

    To change the initially selected color, use
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t.method-set_rgba}[Gtk.ColorChooser.set_rgba]}.
    To get the selected color use [Gtk.ColorChooser.get_rgba].

    The [GtkColorChooserWidget] is used in the
    {{!Ocgtk.Color_chooser_dialog.class-type-color_chooser_dialog_t}[Gtk.ColorChooserDialog]}
    to provide a dialog for selecting colors.

    {b Actions}

    [GtkColorChooserWidget] defines a set of built-in actions:

    - [color.customize] activates the color editor for the given color.
    - [color.select] emits the [Gtk.ColorChooser::color-activated] signal for
      the given color.

    {b CSS names}

    [GtkColorChooserWidget] has a single CSS node with name colorchooser. *)

(** {1:constructors Constructors} *)

val new_ : unit -> color_chooser_widget_t
(** Creates a new [GtkColorChooserWidget]. *)
