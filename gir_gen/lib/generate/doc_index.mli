(* Doc_index — what a doc reference can link to.

   The resolver links a reference only when its target is known to be
   generated, since a link to anything else is a broken odoc reference. The
   index lists the generated types and constants of the current namespace,
   from the generation context and the generator's own filters, and those of
   every namespace with a references file, which lists only generated types. *)

open Types

val empty : doc_index
(** Links to nothing: every reference stays code. *)

val build :
  namespace:string ->
  classes:gir_class list ->
  interfaces:gir_interface list ->
  records:gir_record list ->
  enums:gir_enum list ->
  bitfields:gir_bitfield list ->
  constants:gir_constant list ->
  cross_references:generation_context_namespace_cross_references StringMap.t ->
  doc_index
(** The index for generating [namespace]. Classes, records and constants are
    filtered by the same predicates the emitters use, so the lists may be the
    unfiltered ones. *)
