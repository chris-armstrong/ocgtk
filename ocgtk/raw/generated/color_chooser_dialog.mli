(* GENERATED CODE - DO NOT EDIT *)
(* ColorChooserDialog: ColorChooserDialog *)

(** A dialog for choosing a color.

    An example GtkColorChooserDialog

    [GtkColorChooserDialog] implements the
    {{!Ocgtk.Raw.Color_chooser}[Gtk.ColorChooser]} interface and does not
    provide much API of its own.

    To create a [GtkColorChooserDialog], use
    {{!Ocgtk.Raw.Color_chooser_dialog.val-new_}[Gtk.ColorChooserDialog.new]}.

    To change the initially selected color, use
    {{!Ocgtk.Raw.Color_chooser.val-set_rgba}[Gtk.ColorChooser.set_rgba]}. To get
    the selected color use
    {{!Ocgtk.Raw.Color_chooser.val-get_rgba}[Gtk.ColorChooser.get_rgba]}.

    [GtkColorChooserDialog] has been deprecated in favor of
    {{!Ocgtk.Raw.Color_dialog}[Gtk.ColorDialog]}.

    {b CSS nodes}

    [GtkColorChooserDialog] has a single CSS node with the name [window] and
    style class [.colorchooser].

    The class built on this module is in {!Ocgtk.Color_chooser_dialog}. *)

type t =
  [ `color_chooser_dialog
  | `dialog
  | `window
  | `widget
  | `initially_unowned
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_color_chooser_dialog_get_type"

external new_ :
  string option ->
  Application_and__window_and__window_group.Window.t option ->
  t = "ml_gtk_color_chooser_dialog_new"
(** Creates a new [GtkColorChooserDialog]. *)

(* Methods *)
(* Properties *)

external get_show_editor : t -> bool
  = "ml_gtk_color_chooser_dialog_get_show_editor"
(** Whether the color chooser dialog is showing the single-color editor.

    It can be set to switch the color chooser into single-color editing mode. *)

external set_show_editor : t -> bool -> unit
  = "ml_gtk_color_chooser_dialog_set_show_editor"
(** Whether the color chooser dialog is showing the single-color editor.

    It can be set to switch the color chooser into single-color editing mode. *)
