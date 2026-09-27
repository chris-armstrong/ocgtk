(* Shared char/string predicates for Doc_parse and Doc_render: thin wrappers
   over Containers (CCChar/CCString) where a direct equivalent exists; the
   rest are markdown/odoc-specific and have no library equivalent. *)

val is_upper : char -> bool
val is_lower : char -> bool
val is_digit : char -> bool
val is_letter : char -> bool

val is_ident_char : char -> bool
(** [is_letter c || is_digit c || c = '_']. *)

val is_escapeable : char -> bool
(** Markdown backslash-escapable punctuation used by the GIR doc dialect. *)

val starts_with : string -> int -> string -> bool
(** [starts_with s pos prefix] — [true] iff [s] has [prefix] at [pos]. *)

val contains_sub : string -> string -> bool
(** [contains_sub s sub] — substring containment. *)

val is_blank_line : string -> bool
(** [true] iff the line is empty once trimmed. *)

val strip_trailing_newline : string -> string
(** Drops one trailing ['\n'], if present. *)
