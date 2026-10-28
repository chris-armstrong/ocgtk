(* Entity_doc — the docs of a class, interface or record's modules, class
   type and class at both layers: the translated GIR doc where there is one,
   and the fixed text that tells a reader how the modules fit together. *)

val l1_module :
  namespace:string ->
  class_name:string ->
  class_doc:string option ->
  Doc_emit.t option
(** The layer 1 module's floating doc: the class doc, then a pointer to the
    layer 2 module. Without a class doc, it starts with "Bindings for
    [class_name]." instead, because the first paragraph is also the module's
    synopsis on its parent's page. *)

val l2_module :
  namespace:string ->
  class_name:string ->
  has_constructors:bool ->
  class_doc:string option ->
  Doc_emit.t option
(** The layer 2 module's preamble, kept short so the declarations follow it
    closely: a synopsis, then where the members, the full description and the
    constructors are, and the layer 1 module it is built on. The synopsis is the
    class doc's first paragraph when that paragraph stands on its own, else
    "Bindings for [class_name]."; it is also the module's synopsis on its
    parent's page. *)

val class_heading : string
(** The floating [Class] heading before the layer 2 class type and class. *)

val description :
  class_name:string -> class_doc:string option -> Doc_emit.t option
(** The floating [Description] section after the class: a heading, then the
    whole class doc. [None] without a class doc, or when the synopsis is the
    whole of it. *)

(** A class's parent, or an interface it implements or requires. *)
type ancestor =
  | Bound of { namespace : string; name : string }
      (** Has a layer 2 class type, linked through its own module. *)
  | Unbound of string
      (** No layer 2 class type; named as code, with its GIR name. *)

type inheritance = {
  parent : ancestor option;
  implements : ancestor list;
      (** Every interface the class implements, including those its parent
          already provides, which the class type does not [inherit] again. *)
  requires : ancestor list;  (** An interface's prerequisites. *)
}

val no_inheritance : inheritance

val class_type :
  class_name:string ->
  inheritance:inheritance ->
  class_doc:string option ->
  Doc_emit.t option
(** The doc of the layer 2 [class type]: a bold line saying what it holds, the
    inheritance block (Inherits from, Implements, Requires, each left out when
    empty), then the class doc, so the class doc is on the class type's page as
    well as the module's. *)

val class_ : namespace:string -> class_name:string -> Doc_emit.t option
(** The canned doc of the layer 2 [class]: the layer 1 type it wraps. *)

type layer = Layer1 | Layer2

val combined_module :
  namespace:string ->
  layer:layer ->
  class_names:string list ->
  Doc_emit.t option
(** The floating doc of a module that defines a cycle's classes together: which
    modules re-export them, and that those are the ones to use. *)

val constructors_heading : string
(** The floating [Constructors] heading, with the [constructors] label the layer
    2 module doc links to. *)

val constructor :
  namespace:string ->
  class_name:string ->
  Types.gir_constructor ->
  Doc_emit.t option
(** A constructor's doc at either layer: its translated GIR doc, else "Create a
    new [class_name]. Wraps [c_function]." with the C function linked to its
    gi-docgen page when the namespace has a gi-docgen site. *)

type accessor = Getter | Setter

val property : accessor:accessor -> Types.gir_property -> Doc_emit.t option
(** A property accessor's doc at either layer: the property's translated GIR
    doc, the same on its getter and setter, else "Get property: <name>" or "Set
    property: <name>". *)
