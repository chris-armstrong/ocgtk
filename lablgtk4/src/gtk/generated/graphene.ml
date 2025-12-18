(** Graphene geometry library (minimal bindings for GTK4) *)

module Point = struct
  type t = { x : float; y : float }

  let make ~x ~y = { x; y }

  let zero = { x = 0.; y = 0. }
end

module Rect = struct
  type t = { x : float; y : float; width : float; height : float }

  let make ~x ~y ~width ~height = { x; y; width; height }

  let zero = { x = 0.; y = 0.; width = 0.; height = 0. }

  let contains_point rect point =
    point.Point.x >= rect.x &&
    point.Point.x <= rect.x +. rect.width &&
    point.Point.y >= rect.y &&
    point.Point.y <= rect.y +. rect.height

  let intersects r1 r2 =
    let x1 = r1.x in
    let y1 = r1.y in
    let x2 = r1.x +. r1.width in
    let y2 = r1.y +. r1.height in
    let x3 = r2.x in
    let y3 = r2.y in
    let x4 = r2.x +. r2.width in
    let y4 = r2.y +. r2.height in
    not (x2 < x3 || x4 < x1 || y2 < y3 || y4 < y1)
end

module Size = struct
  type t = { width : float; height : float }

  let make ~width ~height = { width; height }

  let zero = { width = 0.; height = 0. }
end
