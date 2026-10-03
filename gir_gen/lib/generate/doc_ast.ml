(* See the .mli. *)

type context = Entity | Member

type sym_kind =
  | Class
  | Iface
  | Enum
  | Flags
  | Struct
  | Alias
  | Callback
  | Const
  | Ctor
  | Func
  | Method
  | Property
  | Signal
  | Vfunc
  | Error
  | Id
  | Type_kind
[@@deriving eq]

type inline =
  | Text of string
  | Code of string
  | Bold of inline list
  | Italic of inline list
  | Link of { text : inline list; url : string }
  | Page_ref of { text : inline list; path : string; anchor : string option }
  | Sym_ref of {
      kind : sym_kind option;
      endpoint : string;
      anchor : string option;
    }
  | Param_ref of string
  | Ref of string
[@@deriving eq]

type block =
  | Para of inline list
  | Heading of int * inline list
  | List of bool * inline list list
  | Code_block of string
[@@deriving eq]

type t = { blocks : block list }

type fallback =
  | Inline_code_unbalanced of string
  | Code_block_verbatim of string
  | Code_block_stripped of string
  | Sym_ref_degraded of string
  | Page_ref_degraded of string
  | Link_degraded of string
  | Admonition_stripped of string
  | Table_stripped
  | Picture_stripped of string option
  | Image_stripped of string
  | Quote_stripped
[@@deriving eq]

(* [ppx_deriving.eq] derives a function named [equal] (not [equal_t]) for a
   type named [t], which is confusing next to the module's own [equal_t]
   convention; provide [equal_t] by hand so the round-trip tests have the
   module's own structural equality. *)
let equal_t (a : t) (b : t) : bool = List.equal equal_block a.blocks b.blocks
