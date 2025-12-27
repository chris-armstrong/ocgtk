/* GENERATED CODE - DO NOT EDIT */
/* Graphene enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <glib.h>
#include <graphene.h>
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
    case GRAPHENE_EULER_ORDER_SXYZ: return caml_hash_variant("SXYZ"); /* `SXYZ */
    case GRAPHENE_EULER_ORDER_SXYX: return caml_hash_variant("SXYX"); /* `SXYX */
    case GRAPHENE_EULER_ORDER_SXZY: return caml_hash_variant("SXZY"); /* `SXZY */
    case GRAPHENE_EULER_ORDER_SXZX: return caml_hash_variant("SXZX"); /* `SXZX */
    case GRAPHENE_EULER_ORDER_SYZX: return caml_hash_variant("SYZX"); /* `SYZX */
    case GRAPHENE_EULER_ORDER_SYZY: return caml_hash_variant("SYZY"); /* `SYZY */
    case GRAPHENE_EULER_ORDER_SYXZ: return caml_hash_variant("SYXZ"); /* `SYXZ */
    case GRAPHENE_EULER_ORDER_SYXY: return caml_hash_variant("SYXY"); /* `SYXY */
    case GRAPHENE_EULER_ORDER_SZXY: return caml_hash_variant("SZXY"); /* `SZXY */
    case GRAPHENE_EULER_ORDER_SZXZ: return caml_hash_variant("SZXZ"); /* `SZXZ */
    case GRAPHENE_EULER_ORDER_SZYX: return caml_hash_variant("SZYX"); /* `SZYX */
    case GRAPHENE_EULER_ORDER_SZYZ: return caml_hash_variant("SZYZ"); /* `SZYZ */
    case GRAPHENE_EULER_ORDER_RZYX: return caml_hash_variant("RZYX"); /* `RZYX */
    case GRAPHENE_EULER_ORDER_RXYX: return caml_hash_variant("RXYX"); /* `RXYX */
    case GRAPHENE_EULER_ORDER_RYZX: return caml_hash_variant("RYZX"); /* `RYZX */
    case GRAPHENE_EULER_ORDER_RXZX: return caml_hash_variant("RXZX"); /* `RXZX */
    case GRAPHENE_EULER_ORDER_RXZY: return caml_hash_variant("RXZY"); /* `RXZY */
    case GRAPHENE_EULER_ORDER_RYZY: return caml_hash_variant("RYZY"); /* `RYZY */
    case GRAPHENE_EULER_ORDER_RZXY: return caml_hash_variant("RZXY"); /* `RZXY */
    case GRAPHENE_EULER_ORDER_RYXY: return caml_hash_variant("RYXY"); /* `RYXY */
    case GRAPHENE_EULER_ORDER_RYXZ: return caml_hash_variant("RYXZ"); /* `RYXZ */
    case GRAPHENE_EULER_ORDER_RZXZ: return caml_hash_variant("RZXZ"); /* `RZXZ */
    case GRAPHENE_EULER_ORDER_RXYZ: return caml_hash_variant("RXYZ"); /* `RXYZ */
    case GRAPHENE_EULER_ORDER_RZYZ: return caml_hash_variant("RZYZ"); /* `RZYZ */
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
  else if (val == caml_hash_variant("SXYZ")) return GRAPHENE_EULER_ORDER_SXYZ; /* `SXYZ */
  else if (val == caml_hash_variant("SXYX")) return GRAPHENE_EULER_ORDER_SXYX; /* `SXYX */
  else if (val == caml_hash_variant("SXZY")) return GRAPHENE_EULER_ORDER_SXZY; /* `SXZY */
  else if (val == caml_hash_variant("SXZX")) return GRAPHENE_EULER_ORDER_SXZX; /* `SXZX */
  else if (val == caml_hash_variant("SYZX")) return GRAPHENE_EULER_ORDER_SYZX; /* `SYZX */
  else if (val == caml_hash_variant("SYZY")) return GRAPHENE_EULER_ORDER_SYZY; /* `SYZY */
  else if (val == caml_hash_variant("SYXZ")) return GRAPHENE_EULER_ORDER_SYXZ; /* `SYXZ */
  else if (val == caml_hash_variant("SYXY")) return GRAPHENE_EULER_ORDER_SYXY; /* `SYXY */
  else if (val == caml_hash_variant("SZXY")) return GRAPHENE_EULER_ORDER_SZXY; /* `SZXY */
  else if (val == caml_hash_variant("SZXZ")) return GRAPHENE_EULER_ORDER_SZXZ; /* `SZXZ */
  else if (val == caml_hash_variant("SZYX")) return GRAPHENE_EULER_ORDER_SZYX; /* `SZYX */
  else if (val == caml_hash_variant("SZYZ")) return GRAPHENE_EULER_ORDER_SZYZ; /* `SZYZ */
  else if (val == caml_hash_variant("RZYX")) return GRAPHENE_EULER_ORDER_RZYX; /* `RZYX */
  else if (val == caml_hash_variant("RXYX")) return GRAPHENE_EULER_ORDER_RXYX; /* `RXYX */
  else if (val == caml_hash_variant("RYZX")) return GRAPHENE_EULER_ORDER_RYZX; /* `RYZX */
  else if (val == caml_hash_variant("RXZX")) return GRAPHENE_EULER_ORDER_RXZX; /* `RXZX */
  else if (val == caml_hash_variant("RXZY")) return GRAPHENE_EULER_ORDER_RXZY; /* `RXZY */
  else if (val == caml_hash_variant("RYZY")) return GRAPHENE_EULER_ORDER_RYZY; /* `RYZY */
  else if (val == caml_hash_variant("RZXY")) return GRAPHENE_EULER_ORDER_RZXY; /* `RZXY */
  else if (val == caml_hash_variant("RYXY")) return GRAPHENE_EULER_ORDER_RYXY; /* `RYXY */
  else if (val == caml_hash_variant("RYXZ")) return GRAPHENE_EULER_ORDER_RYXZ; /* `RYXZ */
  else if (val == caml_hash_variant("RZXZ")) return GRAPHENE_EULER_ORDER_RZXZ; /* `RZXZ */
  else if (val == caml_hash_variant("RXYZ")) return GRAPHENE_EULER_ORDER_RXYZ; /* `RXYZ */
  else if (val == caml_hash_variant("RZYZ")) return GRAPHENE_EULER_ORDER_RZYZ; /* `RZYZ */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown graphene_euler_order_t tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

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

