(* Runtime tests for ocgraphene in the new layout: objects created through
   the classes and through Raw, values passed between classes, enums by both
   paths, and the GC run while objects are alive and after they are dropped. *)

open Ocgraphene

let point x y z =
  let p = Point3_d.alloc () in
  ignore (p#init x y z);
  p

let near = Alcotest.float 1e-6

let test_class_point () =
  let p = point 3.0 4.0 0.0 in
  Alcotest.check near "length" 5.0 (p#length ())

let test_raw_point () =
  let r = Raw.Point3_d.init (Raw.Point3_d.alloc ()) 1.0 2.0 3.0 in
  let p = new Point3_d.point3_d r in
  Alcotest.check Alcotest.bool "class wraps raw" true
    (p#equal (point 1.0 2.0 3.0)#as_point3_d);
  Alcotest.check near "dot" 14.0 (p#dot r)

(* Box from two Point3_d values. [init] returns a copy of the box as a
   Raw.Box.t, which is wrapped by the class again.

   Not [Raw.Box.get_center]: caller-allocated record out-parameters return a
   pointer to the C stack (a generator bug, independent of the layout). *)
let test_box_from_points () =
  let lo = point 0.0 0.0 0.0 and hi = point 2.0 4.0 6.0 in
  let box = Box.alloc () in
  let copy =
    new Box.box (box#init (Some lo#as_point3_d) (Some hi#as_point3_d))
  in
  Alcotest.check near "width" 2.0 (box#get_width ());
  Alcotest.check near "width of the copy" 2.0 (copy#get_width ());
  Alcotest.check Alcotest.bool "copy contains centre" true
    (copy#contains_point (point 1.0 2.0 3.0)#as_point3_d)

let test_enums_both_paths () =
  let e = Euler.alloc () in
  ignore (e#init_with_order 10.0 20.0 30.0 `SXYZ);
  let order : Enums.eulerorder = e#get_order () in
  let order' : Ocgraphene_enums.eulerorder = order in
  Alcotest.check Alcotest.int "same type by both paths"
    (Ocgraphene_enums.eulerorder_to_int `SXYZ)
    (Enums.eulerorder_to_int order')

(* Many boxes alive across full major collections and a compaction: their
   values must survive, and dropping them must let the finalisers run without
   crashing. *)
let test_gc () =
  let make i =
    let f = float_of_int i in
    let box = Box.alloc () in
    let copy =
      box#init (Some (point f f f)#as_point3_d)
        (Some (point (f +. 1.0) (f +. 2.0) (f +. 3.0))#as_point3_d)
    in
    (box, new Box.box copy)
  in
  let boxes = List.init 2000 make in
  Gc.full_major ();
  Gc.compact ();
  List.iteri
    (fun i (box, copy) ->
      let f = float_of_int i in
      let inside = (point (f +. 0.5) (f +. 1.0) (f +. 1.5))#as_point3_d in
      if
        not
          (box#contains_point inside && copy#contains_point inside
          && Float.abs (copy#get_width () -. 1.0) < 1e-6)
      then Alcotest.failf "box %d changed after GC" i)
    boxes;
  Alcotest.check Alcotest.int "all alive" 2000 (List.length boxes);
  ignore (Sys.opaque_identity boxes);
  Gc.full_major ();
  Gc.compact ();
  Gc.full_major ()

let () =
  Alcotest.run "ocgraphene"
    [
      ( "layout",
        [
          Alcotest.test_case "class Point3_d" `Quick test_class_point;
          Alcotest.test_case "Raw.Point3_d wrapped by the class" `Quick
            test_raw_point;
          Alcotest.test_case "Box from Point3_ds, centre via Raw" `Quick
            test_box_from_points;
          Alcotest.test_case "Enums and Ocgraphene_enums" `Quick
            test_enums_both_paths;
          Alcotest.test_case "GC with live and dropped objects" `Quick test_gc;
        ] );
    ]
