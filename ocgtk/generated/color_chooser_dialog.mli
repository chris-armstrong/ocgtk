(** A dialog for choosing a color.

    Its methods, signals and properties are on
    {!class-type-color_chooser_dialog_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Color_chooser_dialog}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColorChooserDialog].}

    Inherits from: {{!Ocgtk.Dialog.class-type-dialog_t}Ocgtk.Dialog}

    Implements:
    - {{!Ocgtk.Accessible.class-type-accessible_t}Ocgtk.Accessible}
    - {{!Ocgtk.Buildable.class-type-buildable_t}Ocgtk.Buildable}
    - {{!Ocgtk.Color_chooser.class-type-color_chooser_t}Ocgtk.Color_chooser}
    - {{!Ocgtk.Constraint_target.class-type-constraint_target_t}Ocgtk.Constraint_target}
    - {{!Ocgtk.Native.class-type-native_t}Ocgtk.Native}
    - {{!Ocgtk.Root.class-type-root_t}Ocgtk.Root}
    - {{!Ocgtk.Shortcut_manager.class-type-shortcut_manager_t}Ocgtk.Shortcut_manager}

    A dialog for choosing a color.

    An example GtkColorChooserDialog

    [GtkColorChooserDialog] implements the
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t}[Gtk.ColorChooser]}
    interface and does not provide much API of its own.

    To create a [GtkColorChooserDialog], use
    {{!Ocgtk.Color_chooser_dialog.val-new_}[Gtk.ColorChooserDialog.new]}.

    To change the initially selected color, use
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t.method-set_rgba}[Gtk.ColorChooser.set_rgba]}.
    To get the selected color use [Gtk.ColorChooser.get_rgba].

    [GtkColorChooserDialog] has been deprecated in favor of
    {{!Ocgtk.Color_dialog.class-type-color_dialog_t}[Gtk.ColorDialog]}.

    {b CSS nodes}

    [GtkColorChooserDialog] has a single CSS node with the name [window] and
    style class [.colorchooser]. *)
class type color_chooser_dialog_t = object
  inherit Dialog.dialog_t
  inherit Color_chooser.color_chooser_t

  (** {2:properties Properties} *)

  method show_editor : bool
  (** Whether the color chooser dialog is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  method set_show_editor : bool -> unit
  (** Whether the color chooser dialog is showing the single-color editor.

      It can be set to switch the color chooser into single-color editing mode.
  *)

  (** {2:conversions Conversions} *)

  method as_color_chooser_dialog : Raw.Color_chooser_dialog.t
end

class color_chooser_dialog :
  Raw.Color_chooser_dialog.t ->
  color_chooser_dialog_t
(** Wraps a raw handle of {!Ocgtk.Raw.Color_chooser_dialog.t}. *)

(** {1:description Description}

    A dialog for choosing a color.

    An example GtkColorChooserDialog

    [GtkColorChooserDialog] implements the
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t}[Gtk.ColorChooser]}
    interface and does not provide much API of its own.

    To create a [GtkColorChooserDialog], use
    {{!Ocgtk.Color_chooser_dialog.val-new_}[Gtk.ColorChooserDialog.new]}.

    To change the initially selected color, use
    {{!Ocgtk.Color_chooser.class-type-color_chooser_t.method-set_rgba}[Gtk.ColorChooser.set_rgba]}.
    To get the selected color use [Gtk.ColorChooser.get_rgba].

    [GtkColorChooserDialog] has been deprecated in favor of
    {{!Ocgtk.Color_dialog.class-type-color_dialog_t}[Gtk.ColorDialog]}.

    {b CSS nodes}

    [GtkColorChooserDialog] has a single CSS node with the name [window] and
    style class [.colorchooser]. *)

(** {1:constructors Constructors} *)

val new_ : string option -> Window.window_t option -> color_chooser_dialog_t
(** Creates a new [GtkColorChooserDialog]. *)
