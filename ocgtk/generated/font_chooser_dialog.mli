(** The [GtkFontChooserDialog] widget is a dialog for selecting a font.

    Its methods, signals and properties are on
    {!class-type-font_chooser_dialog_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Font_chooser_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontChooserDialog].}

    Inherits from: {{!Ocgtk.Dialog.class-type-dialog_t}Ocgtk.Dialog}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Font_chooser.class-type-font_chooser_t}Ocgtk.Font_chooser}
    - {{!Ocgtk.Native.class-type-native_t}Ocgtk.Native}
    - {{!Ocgtk.Root.class-type-root_t}Ocgtk.Root}
    - {{!Ocgtk.Shortcut_manager.class-type-shortcut_manager_t}Ocgtk.Shortcut_manager}

    The [GtkFontChooserDialog] widget is a dialog for selecting a font.

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
class type font_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit Font_chooser.font_chooser_t

  (** {2:conversions Conversions} *)

  method as_font_chooser_dialog : Raw.Font_chooser_dialog.t
end

class font_chooser_dialog : Raw.Font_chooser_dialog.t -> font_chooser_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Font_chooser_dialog.t}. *)

(** {1:description Description}

    The [GtkFontChooserDialog] widget is a dialog for selecting a font.

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

(** {1:constructors Constructors} *)

val new_ :
  string option ->
  Application_and__window_and__window_group.window_t option ->
  font_chooser_dialog_t
(** Creates a new [GtkFontChooserDialog]. *)
