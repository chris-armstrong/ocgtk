(* GENERATED CODE - DO NOT EDIT *)
(* ActionMap: ActionMap *)

[@@@ocaml.text
"[GActionMap] is an interface for action containers.\n\n\
 The [GActionMap] interface is implemented by [Gio.ActionGroup]\n\
 implementations that operate by containing a number of named\n\
 [Gio.Action] instances, such as [Gio.SimpleActionGroup].\n\n\
 One useful application of this interface is to map the\n\
 names of actions from various action groups to unique,\n\
 prefixed names (e.g. by prepending \"app.\" or \"win.\").\n\
 This is the motivation for the ‘Map’ part of the interface\n\
 name."]

type t = [ `action_map ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_action_map_from_gobject"

(* Methods *)
external remove_action_entries : t -> Action_entry.t array -> int -> unit
  = "ml_g_action_map_remove_action_entries"
[@@ocaml.doc
  "Remove actions from a [Gio.ActionMap]. This is meant as the reverse of\n\
   [Gio.ActionMap.add_action_entries].\n\n\
   {[\n\
   static const GActionEntry entries[] = {\n\
  \    { \"quit\",         activate_quit              },\n\
  \    { \"print-string\", activate_print_string, \"s\" }\n\
   };\n\n\
   void\n\
   add_actions (GActionMap *map)\n\
   {\n\
  \  g_action_map_add_action_entries (map, entries, G_N_ELEMENTS (entries), \
   NULL);\n\
   }\n\n\
   void\n\
   remove_actions (GActionMap *map)\n\
   {\n\
  \  g_action_map_remove_action_entries (map, entries, G_N_ELEMENTS (entries));\n\
   }\n\
   ]}"]

external remove_action : t -> string -> unit = "ml_g_action_map_remove_action"
(** Removes the named action from the action map.

    If no action of this name is in the map then nothing happens. *)

external lookup_action : t -> string -> Action.t option
  = "ml_g_action_map_lookup_action"
(** Looks up the action with the name [action_name] in [action_map].

    If no such action exists, returns [NULL]. *)

external add_action : t -> Action.t -> unit = "ml_g_action_map_add_action"
(** Adds an action to the [action_map].

    If the action map already contains an action with the same name as [action]
    then the old action is dropped from the action map.

    The action map takes its own reference on [action]. *)
