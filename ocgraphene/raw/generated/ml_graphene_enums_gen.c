/* GENERATED CODE - DO NOT EDIT */
/* Graphene enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <graphene.h>
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,2,0)
/* Convert graphene_euler_order_t to OCaml value */
value Val_GrapheneEulerOrder(graphene_euler_order_t val) {
  switch (val) {
    case GRAPHENE_EULER_ORDER_DEFAULT: return caml_hash_variant("DEFAULT"); /* `DEFAULT */
    case GRAPHENE_EULER_ORDER_XYZ: return caml_hash_variant("XYZ"); /* `XYZ */
    case GRAPHENE_EULER_ORDER_YZX: return caml_hash_variant("YZX"); /* `YZX */
    case GRAPHENE_EULER_ORDER_ZXY: return caml_hash_variant("ZXY"); /* `ZXY */
    case GRAPHENE_EULER_ORDER_XZY: return caml_hash_variant("XZY"); /* `XZY */
    case GRAPHENE_EULER_ORDER_YXZ: return caml_hash_variant("YXZ"); /* `YXZ */
    case GRAPHENE_EULER_ORDER_ZYX: return caml_hash_variant("ZYX"); /* `ZYX */
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SXYZ: return caml_hash_variant("SXYZ"); /* `SXYZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SXYX: return caml_hash_variant("SXYX"); /* `SXYX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SXZY: return caml_hash_variant("SXZY"); /* `SXZY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SXZX: return caml_hash_variant("SXZX"); /* `SXZX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SYZX: return caml_hash_variant("SYZX"); /* `SYZX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SYZY: return caml_hash_variant("SYZY"); /* `SYZY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SYXZ: return caml_hash_variant("SYXZ"); /* `SYXZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SYXY: return caml_hash_variant("SYXY"); /* `SYXY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SZXY: return caml_hash_variant("SZXY"); /* `SZXY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SZXZ: return caml_hash_variant("SZXZ"); /* `SZXZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SZYX: return caml_hash_variant("SZYX"); /* `SZYX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_SZYZ: return caml_hash_variant("SZYZ"); /* `SZYZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RZYX: return caml_hash_variant("RZYX"); /* `RZYX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RXYX: return caml_hash_variant("RXYX"); /* `RXYX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RYZX: return caml_hash_variant("RYZX"); /* `RYZX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RXZX: return caml_hash_variant("RXZX"); /* `RXZX */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RXZY: return caml_hash_variant("RXZY"); /* `RXZY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RYZY: return caml_hash_variant("RYZY"); /* `RYZY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RZXY: return caml_hash_variant("RZXY"); /* `RZXY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RYXY: return caml_hash_variant("RYXY"); /* `RYXY */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RYXZ: return caml_hash_variant("RYXZ"); /* `RYXZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RZXZ: return caml_hash_variant("RZXZ"); /* `RZXZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RXYZ: return caml_hash_variant("RXYZ"); /* `RXYZ */

#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
    case GRAPHENE_EULER_ORDER_RZYZ: return caml_hash_variant("RZYZ"); /* `RZYZ */

#endif
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown graphene_euler_order_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to graphene_euler_order_t */
graphene_euler_order_t GrapheneEulerOrder_val(value val) {
  if (val == caml_hash_variant("DEFAULT")) return GRAPHENE_EULER_ORDER_DEFAULT; /* `DEFAULT */
  else if (val == caml_hash_variant("XYZ")) return GRAPHENE_EULER_ORDER_XYZ; /* `XYZ */
  else if (val == caml_hash_variant("YZX")) return GRAPHENE_EULER_ORDER_YZX; /* `YZX */
  else if (val == caml_hash_variant("ZXY")) return GRAPHENE_EULER_ORDER_ZXY; /* `ZXY */
  else if (val == caml_hash_variant("XZY")) return GRAPHENE_EULER_ORDER_XZY; /* `XZY */
  else if (val == caml_hash_variant("YXZ")) return GRAPHENE_EULER_ORDER_YXZ; /* `YXZ */
  else if (val == caml_hash_variant("ZYX")) return GRAPHENE_EULER_ORDER_ZYX; /* `ZYX */
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SXYZ")) return GRAPHENE_EULER_ORDER_SXYZ; /* `SXYZ */

#else
  else if (val == caml_hash_variant("SXYZ")) caml_failwith("graphene_euler_order_t.SXYZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SXYX")) return GRAPHENE_EULER_ORDER_SXYX; /* `SXYX */

#else
  else if (val == caml_hash_variant("SXYX")) caml_failwith("graphene_euler_order_t.SXYX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SXZY")) return GRAPHENE_EULER_ORDER_SXZY; /* `SXZY */

#else
  else if (val == caml_hash_variant("SXZY")) caml_failwith("graphene_euler_order_t.SXZY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SXZX")) return GRAPHENE_EULER_ORDER_SXZX; /* `SXZX */

#else
  else if (val == caml_hash_variant("SXZX")) caml_failwith("graphene_euler_order_t.SXZX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SYZX")) return GRAPHENE_EULER_ORDER_SYZX; /* `SYZX */

#else
  else if (val == caml_hash_variant("SYZX")) caml_failwith("graphene_euler_order_t.SYZX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SYZY")) return GRAPHENE_EULER_ORDER_SYZY; /* `SYZY */

#else
  else if (val == caml_hash_variant("SYZY")) caml_failwith("graphene_euler_order_t.SYZY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SYXZ")) return GRAPHENE_EULER_ORDER_SYXZ; /* `SYXZ */

#else
  else if (val == caml_hash_variant("SYXZ")) caml_failwith("graphene_euler_order_t.SYXZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SYXY")) return GRAPHENE_EULER_ORDER_SYXY; /* `SYXY */

#else
  else if (val == caml_hash_variant("SYXY")) caml_failwith("graphene_euler_order_t.SYXY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SZXY")) return GRAPHENE_EULER_ORDER_SZXY; /* `SZXY */

#else
  else if (val == caml_hash_variant("SZXY")) caml_failwith("graphene_euler_order_t.SZXY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SZXZ")) return GRAPHENE_EULER_ORDER_SZXZ; /* `SZXZ */

#else
  else if (val == caml_hash_variant("SZXZ")) caml_failwith("graphene_euler_order_t.SZXZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SZYX")) return GRAPHENE_EULER_ORDER_SZYX; /* `SZYX */

#else
  else if (val == caml_hash_variant("SZYX")) caml_failwith("graphene_euler_order_t.SZYX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("SZYZ")) return GRAPHENE_EULER_ORDER_SZYZ; /* `SZYZ */

#else
  else if (val == caml_hash_variant("SZYZ")) caml_failwith("graphene_euler_order_t.SZYZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RZYX")) return GRAPHENE_EULER_ORDER_RZYX; /* `RZYX */

#else
  else if (val == caml_hash_variant("RZYX")) caml_failwith("graphene_euler_order_t.RZYX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RXYX")) return GRAPHENE_EULER_ORDER_RXYX; /* `RXYX */

#else
  else if (val == caml_hash_variant("RXYX")) caml_failwith("graphene_euler_order_t.RXYX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RYZX")) return GRAPHENE_EULER_ORDER_RYZX; /* `RYZX */

#else
  else if (val == caml_hash_variant("RYZX")) caml_failwith("graphene_euler_order_t.RYZX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RXZX")) return GRAPHENE_EULER_ORDER_RXZX; /* `RXZX */

#else
  else if (val == caml_hash_variant("RXZX")) caml_failwith("graphene_euler_order_t.RXZX requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RXZY")) return GRAPHENE_EULER_ORDER_RXZY; /* `RXZY */

#else
  else if (val == caml_hash_variant("RXZY")) caml_failwith("graphene_euler_order_t.RXZY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RYZY")) return GRAPHENE_EULER_ORDER_RYZY; /* `RYZY */

#else
  else if (val == caml_hash_variant("RYZY")) caml_failwith("graphene_euler_order_t.RYZY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RZXY")) return GRAPHENE_EULER_ORDER_RZXY; /* `RZXY */

#else
  else if (val == caml_hash_variant("RZXY")) caml_failwith("graphene_euler_order_t.RZXY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RYXY")) return GRAPHENE_EULER_ORDER_RYXY; /* `RYXY */

#else
  else if (val == caml_hash_variant("RYXY")) caml_failwith("graphene_euler_order_t.RYXY requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RYXZ")) return GRAPHENE_EULER_ORDER_RYXZ; /* `RYXZ */

#else
  else if (val == caml_hash_variant("RYXZ")) caml_failwith("graphene_euler_order_t.RYXZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RZXZ")) return GRAPHENE_EULER_ORDER_RZXZ; /* `RZXZ */

#else
  else if (val == caml_hash_variant("RZXZ")) caml_failwith("graphene_euler_order_t.RZXZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RXYZ")) return GRAPHENE_EULER_ORDER_RXYZ; /* `RXYZ */

#else
  else if (val == caml_hash_variant("RXYZ")) caml_failwith("graphene_euler_order_t.RXYZ requires 1.10");
#endif
#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
  else if (val == caml_hash_variant("RZYZ")) return GRAPHENE_EULER_ORDER_RZYZ; /* `RZYZ */

#else
  else if (val == caml_hash_variant("RZYZ")) caml_failwith("graphene_euler_order_t.RZYZ requires 1.10");
#endif
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown graphene_euler_order_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

#endif

#if GRAPHENE_VERSION >= GRAPHENE_ENCODE_VERSION(1,10,0)
/* Convert graphene_ray_intersection_kind_t to OCaml value */
value Val_GrapheneRayIntersectionKind(graphene_ray_intersection_kind_t val) {
  switch (val) {
    case GRAPHENE_RAY_INTERSECTION_KIND_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GRAPHENE_RAY_INTERSECTION_KIND_ENTER: return caml_hash_variant("ENTER"); /* `ENTER */
    case GRAPHENE_RAY_INTERSECTION_KIND_LEAVE: return caml_hash_variant("LEAVE"); /* `LEAVE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown graphene_ray_intersection_kind_t value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to graphene_ray_intersection_kind_t */
graphene_ray_intersection_kind_t GrapheneRayIntersectionKind_val(value val) {
  if (val == caml_hash_variant("NONE")) return GRAPHENE_RAY_INTERSECTION_KIND_NONE; /* `NONE */
  else if (val == caml_hash_variant("ENTER")) return GRAPHENE_RAY_INTERSECTION_KIND_ENTER; /* `ENTER */
  else if (val == caml_hash_variant("LEAVE")) return GRAPHENE_RAY_INTERSECTION_KIND_LEAVE; /* `LEAVE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown graphene_ray_intersection_kind_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

#endif

