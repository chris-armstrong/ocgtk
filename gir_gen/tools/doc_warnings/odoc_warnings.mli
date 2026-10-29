(** The odoc warnings in the output of [dune build @doc], sorted into buckets.

    The log also carries dune's own messages and compiler warnings
    ([Warning 50 [unexpected-docstring]: ...]), which are left out: a warning is
    odoc's when it is a [Warning: ...] line straight after a
    [File "...", line ..., characters ...:] header naming a documentation source
    ([.ml], [.mli] or [.mld]). *)

type bucket =
  | Own_line
      (** Markup that must start a line does not: "Paragraph should begin on its
          own line", "'\{ul ...\}' (bulleted list) should begin on its own
          line". *)
  | Misplaced_tag
      (** A [@tag] parsed where tags may not appear: inside markup or another
          tag, or not at the start of a line. *)
  | Not_allowed  (** Other markup nested where odoc does not allow it. *)
  | Empty_markup  (** Markup or a tag with no content: "\{b\}". *)
  | Unpaired  (** An unmatched delimiter: a stray [}] or [\]], an open block. *)
  | Bad_markup
      (** Markup odoc cannot read: unknown tags, bad heading levels, "\{x\}". *)
  | Unresolved_reference  (** A [\{!...\}] reference whose target is missing. *)
  | Other  (** Any odoc warning not matched above. *)

val equal_bucket : bucket -> bucket -> bool

val all_buckets : bucket list
(** Every bucket, in report order. *)

val bucket_name : bucket -> string
(** Name in reports: ["own-line"], ["unresolved-reference"], ... *)

val is_fixed_at_emission : bucket -> bool
(** Whether the generator is expected to avoid the bucket when it emits docs
    ([Own_line] and [Misplaced_tag]), so its count should be zero. *)

type warning = {
  file : string;
      (** Relative to the repository root: the leading [../] and
          [_build/default/] of odoc's paths are removed. *)
  line : int;
  message : string;  (** The text after [Warning: ]. *)
}

val classify : string -> bucket
(** Bucket of a warning message. *)

val parse : string -> warning list
(** The odoc warnings in a [dune build @doc] log, in log order. *)

type summary
(** Warnings grouped by bucket. *)

val summarise : warning list -> summary
val total : summary -> int
val count : summary -> bucket -> int

val to_line : summary -> string
(** The total, and the non-empty buckets with their counts:
    ["5 (own-line 2, unresolved-reference 3)"], or ["0"]. *)

val to_markdown : summary -> string
(** A heading with the total and a table with one row per bucket (empty buckets
    included), whether it is fixed at emission, and its first warning. *)
