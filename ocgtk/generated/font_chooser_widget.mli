(** The [GtkFontChooserWidget] widget lets the user select a font.

    Its methods, signals and properties are on
    {!class-type-font_chooser_widget_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Font_chooser_widget}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontChooserWidget].}

    Inherits from: {{!Ocgtk.Widget.class-type-widget_t}Ocgtk.Widget}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Font_chooser.class-type-font_chooser_t}Ocgtk.Font_chooser}

    The [GtkFontChooserWidget] widget lets the user select a font.

    It is used in the [GtkFontChooserDialog] widget to provide a dialog for
    selecting fonts.

    To set the font which is initially selected, use [Gtk.FontChooser.set_font]
    or [Gtk.FontChooser.set_font_desc].

    To get the selected font use [Gtk.FontChooser.get_font] or
    [Gtk.FontChooser.get_font_desc].

    To change the text which is shown in the preview area, use
    [Gtk.FontChooser.set_preview_text].

    {b CSS nodes}

    [GtkFontChooserWidget] has a single CSS node with name fontchooser. *)
class type font_chooser_widget_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Font_chooser.font_chooser_t

  (** {2:properties Properties} *)

  method tweak_action : Ocgio.Action.action_t
  (** A toggle action that can be used to switch to the tweak page of the font
      chooser widget, which lets the user tweak the OpenType features and
      variation axes of the selected font.

      The action will be enabled or disabled depending on whether the selected
      font has any features or axes. *)

  (** {2:conversions Conversions} *)

  method as_font_chooser_widget : Raw.Font_chooser_widget.t
end

class font_chooser_widget : Raw.Font_chooser_widget.t -> font_chooser_widget_t
(** Wraps a raw handle of {!Ocgtk.Raw.Font_chooser_widget.t}. *)

(** {1:description Description}

    The [GtkFontChooserWidget] widget lets the user select a font.

    It is used in the [GtkFontChooserDialog] widget to provide a dialog for
    selecting fonts.

    To set the font which is initially selected, use [Gtk.FontChooser.set_font]
    or [Gtk.FontChooser.set_font_desc].

    To get the selected font use [Gtk.FontChooser.get_font] or
    [Gtk.FontChooser.get_font_desc].

    To change the text which is shown in the preview area, use
    [Gtk.FontChooser.set_preview_text].

    {b CSS nodes}

    [GtkFontChooserWidget] has a single CSS node with name fontchooser. *)

(** {1:constructors Constructors} *)

val new_ : unit -> font_chooser_widget_t
(** Creates a new [GtkFontChooserWidget]. *)
