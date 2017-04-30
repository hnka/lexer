package com.hnka.ast;
import com.hnka.visitor.Visitor;
import com.hnka.visitor.TypeVisitor;

public class IntArrayType extends Type {
  public void accept(Visitor v) {
    v.visit(this);
  }

  public Type accept(TypeVisitor v) {
    return v.visit(this);
  }
}
