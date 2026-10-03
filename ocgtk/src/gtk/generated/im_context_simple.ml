(* GENERATED CODE - DO NOT EDIT *)
(* IMContextSimple: IMContextSimple *)

type t = [ `im_context_simple | `im_context | `object_ ] Gobject.obj
(** Supports compose sequences, dead keys and numeric Unicode input.

    {b Compose sequences}

    [GtkIMContextSimple] reads compose sequences from the first of the following
    files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
    /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
    Compose file). A subset of the file syntax described in the Compose(5)
    manual page is supported. Additionally, [include “%L”] loads GTK’s built-in
    table of compose sequences rather than the locale-specific one from X11.

    If none of these files is found, [GtkIMContextSimple] uses a built-in table
    of compose sequences that is derived from the X11 Compose files.

    Note that compose sequences typically start with the Compose_key, which is
    often not available as a dedicated key on keyboards. Keyboard layouts may
    map this keysym to other keys, such as the right Control key.

    {b Unicode characters}

    [GtkIMContextSimple] also supports numeric entry of Unicode characters by
    typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
    hexadecimal Unicode codepoint.

    For example,

    Ctrl-Shift-u 1 2 3 Enter

    yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.

    {b Dead keys}

    [GtkIMContextSimple] supports dead keys. For example, typing

    dead_acute a

    yields U+00E! LATIN SMALL LETTER_A WITH ACUTE, i.e. á. Note that this
    depends on the keyboard layout including dead keys. *)

external new_ : unit -> t = "ml_gtk_im_context_simple_new"
(** Create a new IMContextSimple *)

(* Methods *)

external add_compose_file : t -> string -> unit
  = "ml_gtk_im_context_simple_add_compose_file"
(** Adds an additional table from the X11 compose file. *)
