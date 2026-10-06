(* GENERATED CODE - DO NOT EDIT *)
(* IMContextSimple: IMContextSimple *)

[@@@ocaml.text
"Supports compose sequences, dead keys and numeric Unicode input.\n\n\
 {b Compose sequences}\n\n\
 [GtkIMContextSimple] reads compose sequences from the first of the\n\
 following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,\n\
 /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial\n\
 Compose file). A subset of the file syntax described in the Compose(5)\n\
 manual page is supported. Additionally, [include \"%L\"] loads GTK’s built-in\n\
 table of compose sequences rather than the locale-specific one from X11.\n\n\
 If none of these files is found, [GtkIMContextSimple] uses a built-in table\n\
 of compose sequences that is derived from the X11 Compose files.\n\n\
 Note that compose sequences typically start with the Compose_key, which is\n\
 often not available as a dedicated key on keyboards. Keyboard layouts may\n\
 map this keysym to other keys, such as the right Control key.\n\n\
 {b Unicode characters}\n\n\
 [GtkIMContextSimple] also supports numeric entry of Unicode characters\n\
 by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a\n\
 hexadecimal Unicode codepoint.\n\n\
 For example,\n\n\
 Ctrl-Shift-u 1 2 3 Enter\n\n\
 yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.\n\n\
 {b Dead keys}\n\n\
 [GtkIMContextSimple] supports dead keys. For example, typing\n\n\
 dead_acute a\n\n\
 yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this\n\
 depends on the keyboard layout including dead keys."]

type t = [ `im_context_simple | `im_context | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_im_context_simple_new"
(** Create a new IMContextSimple *)

(* Methods *)

external add_compose_file : t -> string -> unit
  = "ml_gtk_im_context_simple_add_compose_file"
(** Adds an additional table from the X11 compose file. *)
