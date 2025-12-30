# Todos

a high level overview of porting and cleanup tasks needed to get ocgtk4 to a 1.0

## Known bugs

See [KNOWN_BUGS.md](./KNOWN_BUGS.md)

## Split up into several sub-libraries.

At the moment, all of gtk4.gir is generated into ocgtk/src. We want to be able to bind against
other libaries, to at least be able to cross-reference types and classes as needed. This will require
generating gtk4 into a sub-directory and separating the generated from non-generated files internally.

See [REFACTORING_PLAN.md](./REFACTORING_PLAN.md).


## Class hierarchy

* Generate all classes in a class hierarchy with #as_<type>, not just those in the Widget hierarchy (e.g. Expression)
* Update methods that take a class value like "#expression" (which means anything polymorphically implementing that interface) to work

i.e.

```
  method set_expression : 'a . ((#GExpression.expression_skel as 'a) option) -> unit = 
    fun expression ->
      let expression = Option.map (fun (c: #GExpression.expression_skel) -> c#as_expression) expression in
      String_filter.set_expression obj expression
```

## Non-void signals

We don't handle non-void signals / callbacks at this time.

## Interface generation

Interfaces are generated as classes, but need to be generated as virtual classes with virtual methods (and then inherited) or class types to be useful.
