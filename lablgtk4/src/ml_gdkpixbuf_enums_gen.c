/* GENERATED CODE - DO NOT EDIT */
/* GdkPixbuf enum/bitfield converters */

#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <gdk-pixbuf/gdk-pixbuf.h>
/* Convert GdkColorspace to OCaml value */
value Val_GdkPixbufColorspace(GdkColorspace val) {
  switch (val) {
    case GDK_COLORSPACE_RGB: return caml_hash_variant("RGB"); /* `RGB */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkColorspace value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkColorspace */
GdkColorspace GdkPixbufColorspace_val(value val) {
  if (val == caml_hash_variant("RGB")) return GDK_COLORSPACE_RGB; /* `RGB */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkColorspace tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkInterpType to OCaml value */
value Val_GdkPixbufInterpType(GdkInterpType val) {
  switch (val) {
    case GDK_INTERP_NEAREST: return caml_hash_variant("NEAREST"); /* `NEAREST */
    case GDK_INTERP_TILES: return caml_hash_variant("TILES"); /* `TILES */
    case GDK_INTERP_BILINEAR: return caml_hash_variant("BILINEAR"); /* `BILINEAR */
    case GDK_INTERP_HYPER: return caml_hash_variant("HYPER"); /* `HYPER */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkInterpType value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkInterpType */
GdkInterpType GdkPixbufInterpType_val(value val) {
  if (val == caml_hash_variant("NEAREST")) return GDK_INTERP_NEAREST; /* `NEAREST */
  else if (val == caml_hash_variant("TILES")) return GDK_INTERP_TILES; /* `TILES */
  else if (val == caml_hash_variant("BILINEAR")) return GDK_INTERP_BILINEAR; /* `BILINEAR */
  else if (val == caml_hash_variant("HYPER")) return GDK_INTERP_HYPER; /* `HYPER */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkInterpType tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkPixbufAlphaMode to OCaml value */
value Val_GdkPixbufPixbufAlphaMode(GdkPixbufAlphaMode val) {
  switch (val) {
    case GDK_PIXBUF_ALPHA_BILEVEL: return caml_hash_variant("BILEVEL"); /* `BILEVEL */
    case GDK_PIXBUF_ALPHA_FULL: return caml_hash_variant("FULL"); /* `FULL */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufAlphaMode value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkPixbufAlphaMode */
GdkPixbufAlphaMode GdkPixbufPixbufAlphaMode_val(value val) {
  if (val == caml_hash_variant("BILEVEL")) return GDK_PIXBUF_ALPHA_BILEVEL; /* `BILEVEL */
  else if (val == caml_hash_variant("FULL")) return GDK_PIXBUF_ALPHA_FULL; /* `FULL */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufAlphaMode tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkPixbufError to OCaml value */
value Val_GdkPixbufPixbufError(GdkPixbufError val) {
  switch (val) {
    case GDK_PIXBUF_ERROR_CORRUPT_IMAGE: return caml_hash_variant("CORRUPT_IMAGE"); /* `CORRUPT_IMAGE */
    case GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY: return caml_hash_variant("INSUFFICIENT_MEMORY"); /* `INSUFFICIENT_MEMORY */
    case GDK_PIXBUF_ERROR_BAD_OPTION: return caml_hash_variant("BAD_OPTION"); /* `BAD_OPTION */
    case GDK_PIXBUF_ERROR_UNKNOWN_TYPE: return caml_hash_variant("UNKNOWN_TYPE"); /* `UNKNOWN_TYPE */
    case GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION: return caml_hash_variant("UNSUPPORTED_OPERATION"); /* `UNSUPPORTED_OPERATION */
    case GDK_PIXBUF_ERROR_FAILED: return caml_hash_variant("FAILED"); /* `FAILED */
    case GDK_PIXBUF_ERROR_INCOMPLETE_ANIMATION: return caml_hash_variant("INCOMPLETE_ANIMATION"); /* `INCOMPLETE_ANIMATION */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufError value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkPixbufError */
GdkPixbufError GdkPixbufPixbufError_val(value val) {
  if (val == caml_hash_variant("CORRUPT_IMAGE")) return GDK_PIXBUF_ERROR_CORRUPT_IMAGE; /* `CORRUPT_IMAGE */
  else if (val == caml_hash_variant("INSUFFICIENT_MEMORY")) return GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY; /* `INSUFFICIENT_MEMORY */
  else if (val == caml_hash_variant("BAD_OPTION")) return GDK_PIXBUF_ERROR_BAD_OPTION; /* `BAD_OPTION */
  else if (val == caml_hash_variant("UNKNOWN_TYPE")) return GDK_PIXBUF_ERROR_UNKNOWN_TYPE; /* `UNKNOWN_TYPE */
  else if (val == caml_hash_variant("UNSUPPORTED_OPERATION")) return GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION; /* `UNSUPPORTED_OPERATION */
  else if (val == caml_hash_variant("FAILED")) return GDK_PIXBUF_ERROR_FAILED; /* `FAILED */
  else if (val == caml_hash_variant("INCOMPLETE_ANIMATION")) return GDK_PIXBUF_ERROR_INCOMPLETE_ANIMATION; /* `INCOMPLETE_ANIMATION */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufError tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* Convert GdkPixbufRotation to OCaml value */
value Val_GdkPixbufPixbufRotation(GdkPixbufRotation val) {
  switch (val) {
    case GDK_PIXBUF_ROTATE_NONE: return caml_hash_variant("NONE"); /* `NONE */
    case GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE: return caml_hash_variant("COUNTERCLOCKWISE"); /* `COUNTERCLOCKWISE */
    case GDK_PIXBUF_ROTATE_UPSIDEDOWN: return caml_hash_variant("UPSIDEDOWN"); /* `UPSIDEDOWN */
    case GDK_PIXBUF_ROTATE_CLOCKWISE: return caml_hash_variant("CLOCKWISE"); /* `CLOCKWISE */
    default: {
      char msg[128];
      g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufRotation value: %d", (int)val);
      g_warning("%s", msg);
      caml_failwith(msg);
    }
  }
}

/* Convert OCaml value to GdkPixbufRotation */
GdkPixbufRotation GdkPixbufPixbufRotation_val(value val) {
  if (val == caml_hash_variant("NONE")) return GDK_PIXBUF_ROTATE_NONE; /* `NONE */
  else if (val == caml_hash_variant("COUNTERCLOCKWISE")) return GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE; /* `COUNTERCLOCKWISE */
  else if (val == caml_hash_variant("UPSIDEDOWN")) return GDK_PIXBUF_ROTATE_UPSIDEDOWN; /* `UPSIDEDOWN */
  else if (val == caml_hash_variant("CLOCKWISE")) return GDK_PIXBUF_ROTATE_CLOCKWISE; /* `CLOCKWISE */
  else {
    char msg[128];
    g_snprintf(msg, sizeof(msg), "Unknown GdkPixbufRotation tag: %ld", val);
    g_warning("%s", msg);
    caml_failwith(msg);
  }
}

/* GdkPixbufFormatFlags is in GIR but marked skip in C headers */
#ifndef GDK_PIXBUF_FORMAT_WRITABLE
typedef enum {
  GDK_PIXBUF_FORMAT_WRITABLE = 1,
  GDK_PIXBUF_FORMAT_SCALABLE = 2,
  GDK_PIXBUF_FORMAT_THREADSAFE = 4,
} GdkPixbufFormatFlags;
#endif

/* Convert GdkPixbufFormatFlags to OCaml flag list */
value Val_GdkPixbufPixbufFormatFlags(GdkPixbufFormatFlags flags) {
  CAMLparam0();
  CAMLlocal2(result, cons);
  result = Val_emptylist;

  if (flags & GDK_PIXBUF_FORMAT_WRITABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("WRITABLE"))); /* `WRITABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_PIXBUF_FORMAT_SCALABLE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("SCALABLE"))); /* `SCALABLE */
    Store_field(cons, 1, result);
    result = cons;
  }
  if (flags & GDK_PIXBUF_FORMAT_THREADSAFE) {
    cons = caml_alloc(2, 0);
    Store_field(cons, 0, Val_int(caml_hash_variant("THREADSAFE"))); /* `THREADSAFE */
    Store_field(cons, 1, result);
    result = cons;
  }

  CAMLreturn(result);
}

/* Convert OCaml flag list to GdkPixbufFormatFlags */
GdkPixbufFormatFlags GdkPixbufPixbufFormatFlags_val(value list) {
  GdkPixbufFormatFlags result = 0;
  while (list != Val_emptylist) {
    int tag = Int_val(Field(list, 0));
    if (tag == caml_hash_variant("WRITABLE")) result |= GDK_PIXBUF_FORMAT_WRITABLE; /* `WRITABLE */
    else if (tag == caml_hash_variant("SCALABLE")) result |= GDK_PIXBUF_FORMAT_SCALABLE; /* `SCALABLE */
    else if (tag == caml_hash_variant("THREADSAFE")) result |= GDK_PIXBUF_FORMAT_THREADSAFE; /* `THREADSAFE */
    list = Field(list, 1);
  }
  return result;
}

