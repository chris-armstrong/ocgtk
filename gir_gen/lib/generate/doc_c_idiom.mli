(* Doc_c_idiom — the C idioms of GIR docs that have a fixed OCaml reading: the
   literals [TRUE], [FALSE] and [NULL], primitive type sigils such as
   [#gboolean], and sentences telling C callers how to free a returned value.
   None of them needs a symbol index, so [Doc_parse] applies them directly.
   Pure: no I/O, no global state, deterministic. *)

open Doc_ast

val c_lit_of_name : string -> c_lit option
(** [Some] for ["TRUE"], ["FALSE"] and ["NULL"], the names that a [%NAME] sigil
    or a code span holding exactly the name stands for. *)

(** How a C primitive type reads in the bindings. *)
type c_prim_reading =
  | Ocaml_type of string  (** The OCaml type the generator binds it to. *)
  | Pointer
      (** [gpointer] and [gconstpointer] bind to no single type; they read as
          the word "pointer". *)

val ocaml_of_c_prim : string -> c_prim_reading option
(** The reading of a C primitive type name, from the generator's own primitive
    type table, so a doc names the type the signatures use. [None] for a name
    the table does not know. *)

val attach_null_phrases : inline list -> inline list
(** Folds the prose after a [Null] into it, at one level: nested inlines are
    left alone, since the parser applies it to each inline list it builds.
    Before ["-terminated"] or [" terminated"] the literal becomes the plain word
    ["null"]; before an error phrase ([" on error"], [" if an error occurred"],
    ...) it becomes [Null_on_error phrase], and the phrase leaves the following
    text. *)

val strip_ownership : block list -> block list * fallback list
(** Drops each sentence of a paragraph or list item that tells the caller to
    free a value (the ownership allowlist: "free(d) … with g_…", "use g_…free"
    or "use g_…unref", "unref(fed) … with"), one [Ownership_stripped] event per
    sentence naming the pattern. A sentence that only mentions a free function
    is kept. A paragraph or item left empty is removed, and a list left empty
    too. Code blocks and headings are never touched. A block with no matching
    sentence is returned unchanged. *)
