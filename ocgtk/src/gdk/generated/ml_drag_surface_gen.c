/* GENERATED CODE - DO NOT EDIT */
/* C bindings for DragSurface */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_drag_surface_present(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gboolean result = gdk_drag_surface_present(GdkDragSurface_val(self), Int_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}
