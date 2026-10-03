(* GENERATED CODE - DO NOT EDIT *)
(* PadController: PadController *)

(** Handles input from the pads found in drawing tablets.

    Pads are the collection of buttons and tactile sensors often found around
    the stylus-sensitive area.

    These buttons and sensors have no implicit meaning, and by default they
    perform no action. [GtkPadController] is provided to map those to
    [Gio.Action] objects, thus letting the application give them a more semantic
    meaning.

    Buttons and sensors are not constrained to triggering a single action, some
    [GDK_SOURCE_TABLET_PAD] devices feature multiple “modes”. All these input
    elements have one current mode, which may determine the final action being
    triggered.

    Pad devices often divide buttons and sensors into groups. All elements in a
    group share the same current mode, but different groups may have different
    modes. See [Gdk.DevicePad.get_n_groups] and
    [Gdk.DevicePad.get_group_n_modes].

    Each of the actions that a given button/strip/ring performs for a given mode
    is defined by a [Gtk.PadActionEntry]. It contains an action name that will
    be looked up in the given [Gio.ActionGroup] and activated whenever the
    specified input element and mode are triggered.

    A simple example of [GtkPadController] usage: Assigning button 1 in all
    modes and pad devices to an “invert-selection” action:

    {[
    GtkPadActionEntry *pad_actions[] = {
      { GTK_PAD_ACTION_BUTTON, 1, -1, “Invert selection”, “pad-actions.invert-selection” },
      …
    };

    …
    action_group = g_simple_action_group_new ();
    action = g_simple_action_new (“pad-actions.invert-selection”, NULL);
    g_signal_connect (action, “activate”, on_invert_selection_activated, NULL);
    g_action_map_add_action (G_ACTION_MAP (action_group), action);
    …
    pad_controller = gtk_pad_controller_new (action_group, NULL);
    ]}

    The actions belonging to rings/strips/dials will be activated with a
    parameter of type [G_VARIANT_TYPE_DOUBLE] bearing the value of the given
    axis, it is required that those are made stateful and accepting this
    [GVariantType]. For rings the value is the angle of the ring position in
    degrees with 0 facing up. For strips the value is the absolute position on
    the strip, normalized to the \[0.0, 1.0\] range. For dials the value is the
    relative movement of the dial, normalized so that the value 120 represents
    one logical scroll wheel detent in the positive direction. Devices that
    support high-resolution scrolling may send events with fractions of 120 to
    signify a smaller motion. *)

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
