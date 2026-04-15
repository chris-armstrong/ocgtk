(** Runtime integration tests for GList<interface> via L2 VolumeMonitor.

    These tests exercise the Layer 2 GList wrapping/unwrapping code path —
    specifically that Val_GList_with correctly produces L1 objects that the
    generated [List.map (fun ret -> new ...)] expressions can wrap into L2
    objects, and that methods on those L2 objects can then be called.

    In typical CI there are no real hardware drives, so Drive/Volume lists
    will be empty.  Mount lists may also be empty.  Each test is written to
    work correctly on empty lists while still exercising the wrapping machinery
    when elements are present. *)

open Alcotest

module Gio = Ocgtk_gio.Gio

(* Layer 2 VolumeMonitor class *)
module L2_vm = Gio.Volume_monitor

(* Singleton getter (hand-written; g_volume_monitor_get is a free function) *)
let get_l2_vm () =
  let obj = Ocgtk_gio.Gio_volume_monitor_core.volume_monitor_get () in
  new L2_vm.volume_monitor obj

(** Test 1: L2 list return — get mounts and call get_name on each element.
    This verifies that the generated [List.map (fun ret -> new mount ret)]
    wrapper produces usable L2 objects and that calling a method on them
    does not crash. *)
let test_l2_mounts_get_name () =
  let vm = get_l2_vm () in
  let mounts = vm#get_mounts () in
  List.iter (fun m ->
    let name = m#get_name () in
    check bool (Printf.sprintf "mount name '%s' is non-empty" name)
      true (String.length name > 0)
  ) mounts;
  check bool "get_mounts returned a list" true (List.length mounts >= 0)

(** Test 2: Nested interface list — drive#get_volumes then volume#get_name.
    Exercises a second GList-of-interface obtained from an L2 interface object
    (not from the top-level class), and then calls a method on each element. *)
let test_nested_drive_volumes () =
  let vm = get_l2_vm () in
  let drives = vm#get_connected_drives () in
  List.iter (fun d ->
    let drive_name = d#get_name () in
    check bool (Printf.sprintf "drive name '%s' is non-empty" drive_name)
      true (String.length drive_name > 0);
    let volumes = d#get_volumes () in
    List.iter (fun v ->
      let vol_name = v#get_name () in
      check bool (Printf.sprintf "volume name '%s' is non-empty" vol_name)
        true (String.length vol_name > 0)
    ) volumes
  ) drives;
  check bool "get_connected_drives returned a list" true (List.length drives >= 0)

(** Test 3: GC stress — call get_mounts / get_volumes many times with GC
    compaction between iterations.  Any ref-counting bug or use-after-free
    in the Val_GList_with / finaliser code will manifest here. *)
let test_glist_gc_stress () =
  let vm = get_l2_vm () in
  for _ = 1 to 50 do
    let mounts = vm#get_mounts () in
    List.iter (fun m -> ignore (m#get_name ())) mounts;
    let volumes = vm#get_volumes () in
    List.iter (fun v -> ignore (v#get_name ())) volumes;
    Gc.compact ()
  done;
  check bool "gc stress completed without crash" true true

(** Test 4: Mount → optional drive → optional volumes traversal.
    Tests Option return of an interface type combined with a list from that
    interface: mount#get_drive () returns drive_t option, then
    drive#get_volumes () returns volume_t list. *)
let test_mount_drive_volumes () =
  let vm = get_l2_vm () in
  let mounts = vm#get_mounts () in
  List.iter (fun m ->
    (match m#get_drive () with
    | None -> ()
    | Some d ->
        let drive_name = d#get_name () in
        check bool (Printf.sprintf "drive-from-mount name '%s' non-empty" drive_name)
          true (String.length drive_name > 0);
        let vols = d#get_volumes () in
        List.iter (fun v -> ignore (v#get_name ())) vols)
  ) mounts;
  check bool "mount->drive->volumes traversal completed" true true

(** Test Suite *)

let () =
  Alcotest.run "GIO VolumeMonitor L2 GList interface tests" [
    "VolumeMonitor L2", [
      test_case "L2 mounts: get_name on each element" `Quick test_l2_mounts_get_name;
      test_case "nested drive#get_volumes then volume#get_name" `Quick test_nested_drive_volumes;
      test_case "GList GC stress (50 iterations + Gc.compact)" `Slow test_glist_gc_stress;
      test_case "mount -> optional drive -> volume list" `Quick test_mount_drive_volumes;
    ];
  ]
