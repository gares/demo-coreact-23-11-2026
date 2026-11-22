From elpi Require Import elpi.

(* the json file and the Elpi code are declared as dependencies of this .v
   file, under the logical paths demo and demo.rocq (see _RocqProject:
   -R demo demo) *)
From demo Extra Dependency "monicity-V1.json" as monicity_json.
From demo.rocq Extra Dependency "demo-rocq.elpi" as demo_rocq.

Elpi Command demo.
Elpi Accumulate File demo_rocq.
Elpi Export demo.

demo "monicity_json".

Print objects.
Print edges.
