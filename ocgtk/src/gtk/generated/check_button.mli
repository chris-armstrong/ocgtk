(* GENERATED CODE - DO NOT EDIT *)
(* CheckButton: CheckButton *)

[@@@ocaml.text
"Places a label next to an indicator.\n\n\
 Example GtkCheckButtons\n\n\
 A [GtkCheckButton] is created by calling either [Gtk.CheckButton.new]\n\
 or [Gtk.CheckButton.new_with_label].\n\n\
 The state of a [GtkCheckButton] can be set specifically using\n\
 [Gtk.CheckButton.set_active], and retrieved using\n\
 [Gtk.CheckButton.get_active].\n\n\
 {b Inconsistent state}\n\n\
 In addition to \"on\" and \"off\", check buttons can be an\n\
 \"in between\" state that is neither on nor off. This can be used\n\
 e.g. when the user has selected a range of elements (such as some\n\
 text or spreadsheet cells) that are affected by a check button,\n\
 and the current values in that range are inconsistent.\n\n\
 To set a [GtkCheckButton] to inconsistent state, use\n\
 [Gtk.CheckButton.set_inconsistent].\n\n\
 {b Grouping}\n\n\
 Check buttons can be grouped together, to form mutually exclusive\n\
 groups - only one of the buttons can be toggled at a time, and toggling\n\
 another one will switch the currently toggled one off.\n\n\
 Grouped check buttons use a different indicator, and are commonly referred\n\
 to as {i radio buttons}.\n\n\
 Example GtkRadioButtons\n\n\
 To add a [GtkCheckButton] to a group, use [Gtk.CheckButton.set_group].\n\n\
 When the code must keep track of the state of a group of radio buttons, it\n\
 is recommended to keep track of such state through a stateful\n\
 [GAction] with a target for each button. Using the [toggled] signals to keep\n\
 track of the group changes and state is discouraged.\n\n\
 {b Shortcuts and Gestures}\n\n\
 [GtkCheckButton] supports the following keyboard shortcuts:\n\n\
 - <kbd>␣</kbd> or <kbd>Enter</kbd> activates the button.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 checkbutton[.text-button][.grouped]\n\
 ├── check\n\
 ╰── [label]\n\
 ]}\n\n\
 A [GtkCheckButton] has a main node with name checkbutton. If the\n\
 [Gtk.CheckButton:label] or [Gtk.CheckButton:child]\n\
 properties are set, it contains a child widget. The indicator node\n\
 is named check when no group is set, and radio if the checkbutton\n\
 is grouped together with other checkbuttons.\n\n\
 {b Accessibility}\n\n\
 [GtkCheckButton] uses the [Gtk.AccessibleRole.checkbox] role."]

type t = [ `check_button | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_check_button_new"
(** Create a new CheckButton *)

external new_with_label : string option -> t
  = "ml_gtk_check_button_new_with_label"
(** Create a new CheckButton *)

external new_with_mnemonic : string option -> t
  = "ml_gtk_check_button_new_with_mnemonic"
(** Create a new CheckButton *)

(* Methods *)

external set_use_underline : t -> bool -> unit
  = "ml_gtk_check_button_set_use_underline"
(** Sets whether underlines in the label indicate mnemonics.

    If [setting] is [TRUE], an underscore character in [self]'s label indicates
    a mnemonic accelerator key. This behavior is similar to
    [Gtk.Label:use-underline]. *)

external set_label : t -> string option -> unit
  = "ml_gtk_check_button_set_label"
(** Sets the text of [self].

    If [Gtk.CheckButton:use-underline] is [TRUE], an underscore in [label] is
    interpreted as mnemonic indicator, see [Gtk.CheckButton.set_use_underline]
    for details on this behavior. *)

external set_inconsistent : t -> bool -> unit
  = "ml_gtk_check_button_set_inconsistent"
(** Sets the [GtkCheckButton] to inconsistent state.

    You should turn off the inconsistent state again if the user checks the
    check button. This has to be done manually. *)

external set_group : t -> t option -> unit = "ml_gtk_check_button_set_group"
(** Adds [self] to the group of [group].

    In a group of multiple check buttons, only one button can be active at a
    time. The behavior of a checkbutton in a group is also commonly known as a
    {i radio button}.

    Setting the group of a check button also changes the css name of the
    indicator widget's CSS node to 'radio'.

    Setting up groups in a cycle leads to undefined behavior.

    Note that the same effect can be achieved via the [Gtk.Actionable] API, by
    using the same action with parameter type and state type 's' for all buttons
    in the group, and giving each button its own target value. *)

external set_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option ->
  unit = "ml_gtk_check_button_set_child"
(** Sets the child widget of [button].

    Note that by using this API, you take full responsibility for setting up the
    proper accessibility label and description information for [button]. Most
    likely, you'll either set the accessibility label or description for
    [button] explicitly, or you'll set a labelled-by or described-by relations
    from [child] to [button]. *)

external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"
(** Changes the check buttons active state. *)

external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"
(** Returns whether underlines in the label indicate mnemonics. *)

external get_label : t -> string option = "ml_gtk_check_button_get_label"
(** Returns the label of the check button or [NULL] if [CheckButton:child] is
    set. *)

external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"
(** Returns whether the check button is in an inconsistent state. *)

external get_child :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  option = "ml_gtk_check_button_get_child"
(** Gets the child widget of [button] or [NULL] if [CheckButton:label] is set.
*)

external get_active : t -> bool = "ml_gtk_check_button_get_active"
(** Returns whether the check button is active. *)

(* Properties *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_toggled :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
