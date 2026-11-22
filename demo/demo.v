From elpi Require Import elpi.

(* the json file and the Elpi code are declared as dependencies of this .v
   file, under the logical path demo (see _RocqProject: -R demo demo) *)
From demo Extra Dependency "monicity-V1.json" as monicity_json.
From demo Extra Dependency "monicity.elpi" as monicity_code.

Elpi Command monicity.
Elpi Accumulate File monicity_code. (* the same code as demo.elpi *)
Elpi Accumulate lp:{{
  main [str Dep] :-
    std.assert! (coq.extra-dep Dep (some File)) "unknown Extra Dependency",
    std.assert-ok! (json.from_file File J) "cannot read the json file",
    coq.say "the json value:" J,
    monicity.describe J Lines,
    std.forall Lines (l\ coq.say l).
}}.
Elpi Export monicity.

monicity "monicity_json".
