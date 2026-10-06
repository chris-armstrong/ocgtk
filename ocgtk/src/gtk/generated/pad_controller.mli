(* GENERATED CODE - DO NOT EDIT *)
(* PadController: PadController *)

[@@@ocaml.text
"Handles input from the pads found in drawing tablets.\n\n\
 Pads are the collection of buttons and tactile sensors often found around\n\
 the stylus-sensitive area.\n\n\
 These buttons and sensors have no implicit meaning, and by default they\n\
 perform no action. [GtkPadController] is provided to map those to\n\
 [Gio.Action] objects, thus letting the application give them a more\n\
 semantic meaning.\n\n\
 Buttons and sensors are not constrained to triggering a single action,\n\
 some [GDK_SOURCE_TABLET_PAD] devices feature multiple \"modes\". All these\n\
 input elements have one current mode, which may determine the final action\n\
 being triggered.\n\n\
 Pad devices often divide buttons and sensors into groups. All elements\n\
 in a group share the same current mode, but different groups may have\n\
 different modes. See [Gdk.DevicePad.get_n_groups] and\n\
 [Gdk.DevicePad.get_group_n_modes].\n\n\
 Each of the actions that a given button/strip/ring performs for a given mode\n\
 is defined by a [Gtk.PadActionEntry]. It contains an action name that\n\
 will be looked up in the given [Gio.ActionGroup] and activated whenever\n\
 the specified input element and mode are triggered.\n\n\
 A simple example of [GtkPadController] usage: Assigning button 1 in all\n\
 modes and pad devices to an \"invert-selection\" action:\n\n\
 {[\n\
 GtkPadActionEntry *pad_actions[] = {\n\
\  { GTK_PAD_ACTION_BUTTON, 1, -1, \"Invert selection\", \
 \"pad-actions.invert-selection\" },\n\
\  …\n\
 };\n\n\
 …\n\
 action_group = g_simple_action_group_new ();\n\
 action = g_simple_action_new (\"pad-actions.invert-selection\", NULL);\n\
 g_signal_connect (action, \"activate\", on_invert_selection_activated, NULL);\n\
 g_action_map_add_action (G_ACTION_MAP (action_group), action);\n\
 …\n\
 pad_controller = gtk_pad_controller_new (action_group, NULL);\n\
 ]}\n\n\
 The actions belonging to rings/strips/dials will be activated with a parameter\n\
 of type [G_VARIANT_TYPE_DOUBLE] bearing the value of the given axis, it\n\
 is required that those are made stateful and accepting this [GVariantType].\n\
 For rings the value is the angle of the ring position in degrees with 0\n\
 facing up. For strips the value is the absolute position on the strip, \
 normalized\n\
 to the \\[0.0, 1.0\\] range.\n\
 For dials the value is the relative movement of the dial, normalized so that \
 the\n\
 value 120 represents one logical scroll wheel detent in the positive direction.\n\
 Devices that support high-resolution scrolling may send events with fractions \
 of\n\
 120 to signify a smaller motion."]

type t = [ `pad_controller | `event_controller | `object_ ] Gobject.obj

external new_ :
  Ocgtk_gio.Gio.Wrappers.Action_group.t ->
  Ocgtk_gdk.Gdk.Wrappers.Device.t option ->
  t = "ml_gtk_pad_controller_new"
(** Create a new PadController *)

(* Methods *)

external set_action_entries : t -> Pad_action_entry.t array -> int -> unit
  = "ml_gtk_pad_controller_set_action_entries"
(** A convenience function to add a group of action entries on [controller].

    See [Gtk.PadActionEntry] and [Gtk.PadController.set_action]. *)

external set_action :
  t -> Gtk_enums.padactiontype -> int -> int -> string -> string -> unit
  = "ml_gtk_pad_controller_set_action_bytecode"
    "ml_gtk_pad_controller_set_action_native"
(** Adds an individual action to [controller].

    This action will only be activated if the given button/ring/strip number in
    [index] is interacted while the current mode is [mode]. -1 may be used for
    simple cases, so the action is triggered on all modes.

    The given [label] should be considered user-visible, so internationalization
    rules apply. Some windowing systems may be able to use those for user
    feedback. *)

(* Properties *)

external get_action_group : t -> Ocgtk_gio.Gio.Wrappers.Action_group.t
  = "ml_gtk_pad_controller_get_action_group"
(** Get property: action-group *)

external get_pad : t -> Ocgtk_gdk.Gdk.Wrappers.Device.t
  = "ml_gtk_pad_controller_get_pad"
(** Get property: pad *)
