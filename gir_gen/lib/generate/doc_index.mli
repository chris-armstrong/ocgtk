(* Doc_index — what a doc reference can link to.

   The resolver links a reference only when its target is known to be
   generated, since a link to anything else is a broken odoc reference. The
   index lists the generated types and constants of the current namespace,
   from the generation context and the generator's own filters, and those of
   every namespace with a references file, which lists only generated types.
   Members are listed for every namespace: the members of each generated type
   at each layer, from [Emitted_members], and the members of each enumeration
   and bitfield. The current namespace's tables are computed here; a references
   file holds the same tables for its namespace, written by
   [cross_reference_members] and [enum_members], and read back here. A file
   without them lists no members, and its namespace is marked as such
   ([di_members_listed]).

   Legacy sigils and C calls name C symbols, so types and constants are also
   listed by C name, and enumeration and bitfield members, methods and
   constructors by C identifier. *)

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
(** The index for generating [namespace], without the member tables of its
    classes, interfaces and records. Classes, records and constants are filtered
    by the same predicates the emitters use, so the lists may be the unfiltered
    ones. *)

val with_members : ctx:generation_context -> entity list -> doc_index
(** [ctx.doc_index] with the member tables of [entities], and their methods and
    constructors by C identifier. [entities] are the generated classes,
    interfaces and records of the current namespace. Deciding what an entity
    emits needs the generation context, so this is a second step. *)

val enum_members : gir_enum -> (string * string) list
(** An enumeration's members, GIR name to C identifier, as the index and a
    references file list them. *)

val bitfield_members : gir_bitfield -> (string * string) list
(** A bitfield's members, likewise. *)

val cross_reference_members :
  ctx:generation_context -> entity -> cross_reference_members
(** The member tables of [entity], a generated class, interface or record of the
    current namespace, for its references file: those [with_members] put in
    [ctx.doc_index], so the file lists exactly what generation emits. *)

val of_cross_references :
  generation_context_namespace_cross_references -> doc_index_namespace
(** What a doc reference can link to in a namespace with a references file: its
    types and constants, and the member tables the file lists. *)
