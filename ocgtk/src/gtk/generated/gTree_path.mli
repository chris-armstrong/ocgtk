class type tree_path_t = object
    method append_index : int -> unit
    method compare : Tree_path.t -> int
    method copy : unit -> Tree_path.t
    method down : unit -> unit
    method free : unit -> unit
    method get_depth : unit -> int
    method is_ancestor : Tree_path.t -> bool
    method is_descendant : Tree_path.t -> bool
    method next : unit -> unit
    method prepend_index : int -> unit
    method prev : unit -> bool
    method to_string : unit -> string option
    method up : unit -> bool
    method as_tree_path : Tree_path.t
end

class tree_path : Tree_path.t -> tree_path_t

val new_ : unit -> tree_path_t
val new_first : unit -> tree_path_t
val new_from_indicesv : int array -> int -> tree_path_t
val new_from_string : string -> tree_path_t
