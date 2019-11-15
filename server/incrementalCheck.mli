(* Copyright (c) 2016-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree. *)
open Core

type errors = State.Error.t list [@@deriving show]

val recheck
  :  module_tracker:Analysis.ModuleTracker.t ->
  ast_environment:Analysis.AstEnvironment.t ->
  errors:Analysis.Check.Error.t list Ast.Reference.Table.t ->
  scheduler:Scheduler.t ->
  connections:State.connections ->
  open_documents:string Ast.Reference.Table.t ->
  lookups:Analysis.Lookup.t String.Table.t ->
  configuration:Configuration.Analysis.t ->
  PyrePath.t list ->
  Analysis.TypeEnvironment.t * Analysis.Error.t list

val recheck_with_state
  :  state:State.t ->
  configuration:Configuration.Analysis.t ->
  PyrePath.t list ->
  State.t * errors
