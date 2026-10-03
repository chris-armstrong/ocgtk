(* GENERATED CODE - DO NOT EDIT *)
(* FontChooserDialog: FontChooserDialog *)

(** The [GtkFontChooserDialog] widget is a dialog for selecting a font.

    An example GtkFontChooserDialog

    [GtkFontChooserDialog] implements the [Gtk.FontChooser] interface and does
    not provide much API of its own.

    To create a [GtkFontChooserDialog], use [Gtk.FontChooserDialog.new].

    {b GtkFontChooserDialog as GtkBuildable}

    The [GtkFontChooserDialog] implementation of the [GtkBuildable] interface
    exposes the buttons with the names “select_button” and “cancel_button”.

    {b CSS nodes}

    [GtkFontChooserDialog] has a single CSS node with the name [window] and
    style class [.fontchooser]. *)

type t =
  [ `font_chooser_dialog
  | `dialog
  | `window
  | `widget
  | `initially_unowned
  | `object_ ]
  Gobject.obj

external new_ :
  string option ->
  Application_and__window_and__window_group.Window.t option ->
  t = "ml_gtk_font_chooser_dialog_new"
(** Create a new FontChooserDialog *)

(* Methods *)
