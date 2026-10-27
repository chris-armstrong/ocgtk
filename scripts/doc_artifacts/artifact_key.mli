(** The key an artifact is stored under: the commit it was built from, and
    whether the working tree had uncommitted changes. *)

type t = private
  | Clean of string  (** Full commit sha; the artifact never changes. *)
  | Dirty of string
      (** Full commit sha of a tree with uncommitted changes; rebuilt and
          overwritten on every build. *)

val of_tree : sha:string -> is_dirty:bool -> (t, string) result
(** Error unless [sha] is a full (40 hex digit) commit sha. *)

val of_string : string -> (t, string) result
(** Parses {!to_string}'s output. *)

val to_string : t -> string
(** [<sha>] or [<sha>-dirty]: the artifact's file name stem. *)

val sha : t -> string

val resolve : available:string list -> string -> (t, string) result
(** The artifact a user names: the key in [available] (artifact file name stems)
    equal to the query, else the only one it is a prefix of. *)
