(* GENERATED CODE - DO NOT EDIT *)
(* FontChooserWidget: FontChooserWidget *)

(** The [GtkFontChooserWidget] widget lets the user select a font.

    It is used in the [GtkFontChooserDialog] widget to provide a dialog for
    selecting fonts.

    To set the font which is initially selected, use [Gtk.FontChooser.set_font]
    or [Gtk.FontChooser.set_font_desc].

    To get the selected font use [Gtk.FontChooser.get_font] or
    [Gtk.FontChooser.get_font_desc].

    To change the text which is shown in the preview area, use
    [Gtk.FontChooser.set_preview_text].

    {b CSS nodes}

    [GtkFontChooserWidget] has a single CSS node with name fontchooser.

    The class built on this module is in {!Ocgtk.Font_chooser_widget}. *)

type t =
  [ `font_chooser_widget | `widget | `initially_unowned | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_font_chooser_widget_get_type"

external new_ : unit -> t = "ml_gtk_font_chooser_widget_new"
(** Create a new FontChooserWidget *)

(* Methods *)
(* Properties *)

external get_tweak_action : t -> Ocgio_raw.Action.t
  = "ml_gtk_font_chooser_widget_get_tweak_action"
(** Get property: tweak-action *)
