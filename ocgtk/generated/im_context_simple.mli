(** Supports compose sequences, dead keys and numeric Unicode input.

    Its methods, signals and properties are on
    {!class-type-im_context_simple_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgtk.Raw.Im_context_simple}. *)

(** {1:class Class} *)

class type im_context_simple_t = object
  inherit Im_context.im_context_t

  (** {2:methods Methods} *)

  method add_compose_file : string -> unit
  (** Adds an additional table from the X11 compose file. *)

  (** {2:conversions Conversions} *)

  method as_im_context_simple : Raw.Im_context_simple.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [IMContextSimple].}\n\n\
     Inherits from: \
     {{!Ocgtk.Im_context.class-type-im_context_t}Ocgtk.Im_context}\n\n\
     Supports compose sequences, dead keys and numeric Unicode input.\n\n\
     {b Compose sequences}\n\n\
     [GtkIMContextSimple] reads compose sequences from the first of the\n\
     following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,\n\
     /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial\n\
     Compose file). A subset of the file syntax described in the Compose(5)\n\
     manual page is supported. Additionally, [include \"%L\"] loads GTK’s \
     built-in\n\
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

class im_context_simple : Raw.Im_context_simple.t -> im_context_simple_t
(** Wraps a raw handle of {!Ocgtk.Raw.Im_context_simple.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Supports compose sequences, dead keys and numeric Unicode input.\n\n\
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

(** {1:constructors Constructors} *)

val new_ : unit -> im_context_simple_t
(** Creates a new [GtkIMContextSimple]. *)
