package com.hnka.bnf;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link TesteParser}.
 */
public interface TesteListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link TesteParser#r}.
	 * @param ctx the parse tree
	 */
	void enterR(TesteParser.RContext ctx);
	/**
	 * Exit a parse tree produced by {@link TesteParser#r}.
	 * @param ctx the parse tree
	 */
	void exitR(TesteParser.RContext ctx);
}