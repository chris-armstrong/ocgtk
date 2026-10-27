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

    Its methods, signals and properties are on
    {!class-type-font_chooser_widget_t}. The functions it is built on are in
    {!Ocgtk.Raw.Font_chooser_widget}. *)

(** The methods, signals and properties of a [GtkFontChooserWidget]. *)
class type font_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t
  method tweak_action : Ocgio.Action.action_t
  method as_font_chooser_widget : Raw.Font_chooser_widget.t
end

class font_chooser_widget : Raw.Font_chooser_widget.t -> font_chooser_widget_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Font_chooser_widget.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GtkFontChooserWidget], give one already wrapped. *)

val new_ : unit -> font_chooser_widget_t
