package com.hnka.ast;
import com.hnka.visitor.Visitor;
import com.hnka.visitor.TypeVisitor;

public abstract class Statement {
  public abstract void accept(Visitor v);
  public abstract Type accept(TypeVisitor v);
}
