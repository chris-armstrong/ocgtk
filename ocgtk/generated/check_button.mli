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
 [GtkCheckButton] uses the [Gtk.AccessibleRole.checkbox] role.\n\n\
 Its methods, signals and properties are on {!class-type-check_button_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Check_button}."]

(** The methods, signals and properties of a [GtkCheckButton]. *)
class type check_button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_toggled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_active : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_inconsistent : unit -> bool
  method get_label : unit -> string option
  method get_use_underline : unit -> bool
  method set_active : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_group : check_button_t option -> unit
  method set_inconsistent : bool -> unit
  method set_label : string option -> unit
  method set_use_underline : bool -> unit
  method as_check_button : Raw.Check_button.t
end

class check_button : Raw.Check_button.t -> check_button_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Check_button.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCheckButton], give one already wrapped. *)

val new_ : unit -> check_button_t
val new_with_label : string option -> check_button_t
val new_with_mnemonic : string option -> check_button_t
