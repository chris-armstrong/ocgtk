class type shortcut_trigger_t = object
  method compare : shortcut_trigger_t -> int
  (** The types of [trigger1] and [trigger2] are [gconstpointer] only to allow
      use of this function as a [GCompareFunc].

      They must each be a [GtkShortcutTrigger]. *)

  method equal : shortcut_trigger_t -> bool
  (** Checks if [trigger1] and [trigger2] trigger under the same conditions.

      The types of [one] and [two] are [gconstpointer] only to allow use of this
      function with [GHashTable]. They must each be a [GtkShortcutTrigger]. *)

  method hash : unit -> int
  (** Generates a hash value for a [GtkShortcutTrigger].

      The output of this function is guaranteed to be the same for a given value
      only per-process. It may change between different processor architectures
      or even different versions of GTK. Do not use this function as a basis for
      building protocols or file formats.

      The types of [trigger] is [gconstpointer] only to allow use of this
      function with [GHashTable]. They must each be a [GtkShortcutTrigger]. *)

  method to_label : Ocgdk.Display.display_t -> string
  (** Gets textual representation for the given trigger.

      This function is returning a translated string for presentation to end
      users for example in menu items or in help texts.

      The [display] in use may influence the resulting string in various forms,
      such as resolving hardware keycodes or by causing display-specific
      modifier names.

      The form of the representation may change at any time and is not
      guaranteed to stay identical. *)

  method to_string : unit -> string
  (** Prints the given trigger into a human-readable string.

      This is a small wrapper around [Gtk.ShortcutTrigger.print] to help when
      debugging. *)

  method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch
  (** Checks if the given [event] triggers [self]. *)

  method as_shortcut_trigger : Raw.Shortcut_trigger.t
end

(* High-level class for ShortcutTrigger *)
class shortcut_trigger (obj : Raw.Shortcut_trigger.t) : shortcut_trigger_t =
  object (self)
    method compare : shortcut_trigger_t -> int =
      fun trigger2 ->
        let trigger2 = trigger2#as_shortcut_trigger in
        Raw.Shortcut_trigger.compare obj trigger2

    method equal : shortcut_trigger_t -> bool =
      fun trigger2 ->
        let trigger2 = trigger2#as_shortcut_trigger in
        Raw.Shortcut_trigger.equal obj trigger2

    method hash : unit -> int = fun () -> Raw.Shortcut_trigger.hash obj

    method to_label : Ocgdk.Display.display_t -> string =
      fun display ->
        let display = display#as_display in
        Raw.Shortcut_trigger.to_label obj display

    method to_string : unit -> string =
      fun () -> Raw.Shortcut_trigger.to_string obj

    method trigger : Ocgdk.Event.event_t -> bool -> Ocgdk.Enums.keymatch =
      fun event enable_mnemonics ->
        let event = event#as_event in
        Raw.Shortcut_trigger.trigger obj event enable_mnemonics

    method as_shortcut_trigger = obj
  end

let parse_string (string : string) : shortcut_trigger_t =
  let obj_ = Raw.Shortcut_trigger.parse_string string in
  new shortcut_trigger obj_
