package tink.typecrawler;

import haxe.macro.Expr;
import haxe.macro.Type;
import tink.typecrawler.FieldInfo;
import haxe.ds.Option;

typedef GenType = Type->Position->Expr;

typedef Generator = {
  function args():Array<String>;
  function nullable(e:Expr):Expr;
  function string():Expr;
  function float():Expr;
  function int():Expr;
  function dyn(e:Expr, ct:ComplexType):Expr;
  function dynAccess(e:Expr):Expr;
  function bool():Expr;
  function date():Expr;
  function bytes():Expr;
  function anon(fields:Array<FieldInfo>, ct:ComplexType):Function;//TODO: find out why I wanted this to be a function ... I have a feeling that it's just an artifact of an intermediary state of this code
  function array(e:Expr):Expr;
  function map(k:Expr, v:Expr):Expr;
  function enm(constructors:Array<EnumConstructor>, ct:ComplexType, pos:Position, gen:GenType):Expr;
  function rescue(t:Type, pos:Position, gen:GenType):Option<Expr>;
  function reject(t:Type):String;
}

typedef EnumConstructor = {
  inlined:Bool, 
  ctor: EnumField,
  fields:Array<FieldInfo>,  
}