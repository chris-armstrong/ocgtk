(** A dialog for choosing a color.

    An example GtkColorChooserDialog

    [GtkColorChooserDialog] implements the [Gtk.ColorChooser] interface and does
    not provide much API of its own.

    To create a [GtkColorChooserDialog], use [Gtk.ColorChooserDialog.new].

    To change the initially selected color, use [Gtk.ColorChooser.set_rgba]. To
    get the selected color use [Gtk.ColorChooser.get_rgba].

    [GtkColorChooserDialog] has been deprecated in favor of [Gtk.ColorDialog].

    {b CSS nodes}

    [GtkColorChooserDialog] has a single CSS node with the name [window] and
    style class [.colorchooser].

    Its methods, signals and properties are on
    {!class-type-color_chooser_dialog_t}. The functions it is built on are in
    {!Ocgtk.Raw.Color_chooser_dialog}. *)

(** The methods, signals and properties of a [GtkColorChooserDialog]. *)
class type color_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit Color_chooser.color_chooser_t
  method show_editor : bool
  method set_show_editor : bool -> unit
  method as_color_chooser_dialog : Raw.Color_chooser_dialog.t
end

class color_chooser_dialog :
  Raw.Color_chooser_dialog.t ->
  color_chooser_dialog_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_chooser_dialog.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkColorChooserDialog], give one already wrapped. *)

val new_ :
  string option ->
  Application_and__window_and__window_group.window_t option ->
  color_chooser_dialog_t
